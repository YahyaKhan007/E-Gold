import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/bank.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/models/inStore.dart';
import 'package:e_gold/models/kyc.dart';
import 'package:e_gold/models/userProfile.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/inStore_service.dart';
import 'package:e_gold/services/kyc_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:e_gold/ui/views/edit_profile/edit_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _snackbarService = locator<SnackbarService>();
  final userProfileService = locator<UserProfileService>();
  String _verificationId = "";
  final _UserProfileService = locator<UserProfileService>();
  final _BalanceService = locator<BalanceService>();
  final _cryptoService = locator<CryptoService>();
  final _bankService = locator<BankService>();
  final _inStoreService = locator<InStoreService>();
  final _kycService = locator<KycService>();

  Future<User?> signUpWithEmail(
      String email, String password, String name) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      await credential.user?.sendEmailVerification();

      UserProfile user = UserProfile(
          totalGoldHoldings: 0.0,
          isAdmin: false,
          name: name,
          profileImg: '',
          countryCode: '',
          email: email,
          uid: credential.user!.uid,
          phoneNumber: "",
          dateOfBirth: '',
          lastDayGoldPrice: 0.0,
          createdAt: Timestamp.now());
      Crypto cryptoData = Crypto(walletAddress: '', securityPin: '');
      Bank bankData = Bank(bankName: '', accountNumber: '', swiftCode: '');
      InStore instoreData = InStore(uid: credential.user!.uid, balance: 0.0);
      KYC kycData = KYC(
          cnicNumber: '',
          cardFrontPhotoLink: '',
          cardBackPhotoLink: '',
          passportNumber: '',
          bankAccountNumber: '',
          bankName: '',
          concentAgreement: false,
          isApproved: false,
          ifscCode: '',
          profilePhotoLink: '',
          dateOfBirth: '');
      await _UserProfileService.addUserToFirestore(user);
      await _UserProfileService.getUser();
      await _BalanceService.createBalance(
          FirebaseAuth.instance.currentUser!.uid, 0.0, 0.0);
      await _kycService.saveKYCData(kycData);
      await _cryptoService.addCryptoToWallet(cryptoData);
      await _bankService.addBankToWallet(bankData);
      await _inStoreService.addInStoreToWallet(instoreData);
      _showSuccessSnackbar('Sign-up successful! Verification email sent.');

      return credential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    } catch (e) {
      _handleGeneralException(e);
    }
    return null;
  }

  Future<void> changePasswordWithCurrentPassword(
    String currentPassword,
    String newPassword,
  ) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Create credentials for reauthentication
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );

        // Reauthenticate the user with current credentials
        await user.reauthenticateWithCredential(credential);

        // Update the user's password
        await user.updatePassword(newPassword);
        _showSuccessSnackbar('Change Password successful!');
        print('Password updated successfully!');
      } else {
        _showErrorSnackbar('No user signed in.');
        // Handle the case where no user is signed in
        print('No user signed in.');
      }
    } catch (e) {
      _showErrorSnackbar(e.toString());
      print('Error changing password: $e');
      // Handle errors, such as invalid password, user reauthentication failure, or other issues
    }
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null && userCredential.user!.emailVerified) {
        _showSuccessSnackbar('Sign-in successful!');
        return userCredential.user;
      } else {
        // User is either null or email is not verified
        _showErrorSnackbar(
            'Email not verified. Please check your email for verification.');
        // Sign out the user as they are not allowed to sign in without email verification
        await _auth.signOut();
      }
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    } catch (e) {
      _handleGeneralException(e);
    }
    return null;
  }

  Future<void> signOut() async {
    userProfileService.cleanUser();
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      log("My Entered phone number is : $phoneNumber");
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (AuthCredential authCredential) async {
          await _auth.signInWithCredential(authCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print("Verification Failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      print("Error during phone number verification: $e");
    }
  }

  // Future<void> signInWithPhoneNumber(String smsCode) async {
  //   try {
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId,
  //       smsCode: smsCode,
  //     );

  //     await _auth.signInWithCredential(credential);
  //     print("Successfully signed in with phone number!");
  //   } catch (e) {
  //     print("Error during phone number verification: $e");
  //   }
  // }
  Future<bool> signInWithPhoneNumber(
      String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );

      UserCredential authResult = await _auth.signInWithCredential(credential);

      // Get the user object from the UserCredential
      User userAuth = authResult.user!;

      // Check if the user data exists in Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userAuth.uid)
          .get();

      if (userDoc.exists) {
        // User data exists, sign in
        print('User already exists');
        _showSuccessSnackbar('Successfully signed in with phone number!');
        return true;
      } else {
        UserProfile user = UserProfile(
          totalGoldHoldings: 0.0,
          isAdmin: false,
          name: '',
          profileImg: '',
          countryCode: '',
          email: '',
          uid: userAuth.uid,
          phoneNumber: '',
          dateOfBirth: '',
          lastDayGoldPrice: 0.0,
          createdAt: Timestamp.now(),
        );
        _UserProfileService.addUserToFirestore(user);
        // User data doesn't exist, create a new document
        print('New user created');
        _showSuccessSnackbar('Successfully signed in with phone number!');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => const EditProfileView(
                      isProperAccount: false,
                    )));
        return true;
      }
    } catch (e) {
      print("Error during phone number verification: $e");
      // Handle the error and show an error message if needed
      _showErrorSnackbar('Error during phone number verification');
      return false;
    }
  }

  Future<User?> signUpWithPhoneNumberAndPassword(
      String phoneNumber, String password) async {
    try {
      // Step 1: Create user with phone number
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // This callback is triggered when the verification is done automatically.
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          _handleAuthException(e);
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Step 2: After phone number verification, create user with email/password
          final AuthCredential credential = EmailAuthProvider.credential(
            email: '$phoneNumber@example.com',
            password: password,
          );

          await _auth.createUserWithEmailAndPassword(
            email: '$phoneNumber@example.com',
            password: password,
          );

          _showSuccessSnackbar('Sign-up successful!');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // This callback is triggered when the auto-retrieval of the verification code times out.
        },
      );
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    } catch (e) {
      _handleGeneralException(e);
    }

    return _auth.currentUser;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // // Obtain the auth details from the request
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      var userCred = await _auth.signInWithCredential(credential);

      log(userCred.toString());

      return userCred;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void _handleAuthException(FirebaseAuthException error) {
    String errorMessage;
    switch (error.code) {
      case 'weak-password':
        errorMessage = 'The password provided is too weak.';
        break;
      case 'email-already-in-use':
        errorMessage = 'The account already exists for that email.';
        break;
      case 'user-not-found':
      case 'wrong-password':
        errorMessage = 'Invalid email or password.';
        break;
      default:
        errorMessage = 'An error occurred. Please try again.';
    }
    _showErrorSnackbar(errorMessage);
  }

  void _handleGeneralException(dynamic error) {
    print("Error during authentication: $error");
    _showErrorSnackbar('An unexpected error occurred.');
  }

  void _showErrorSnackbar(String message) {
    _showSnackbar(message, 'Error');
  }

  void _showSuccessSnackbar(String message) {
    _showSnackbar(message, 'Success');
  }

  void _showSnackbar(String message, String title) {
    _snackbarService.showSnackbar(
      message: message,
      title: title,
      duration: const Duration(seconds: 2),
    );
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Password reset email sent successfully
      _showSuccessSnackbar('Password reset email sent successfully');
      print("Password reset email sent successfully");
    } catch (e) {
      // Error occurred while sending password reset email
      _showErrorSnackbar('Error sending password reset email.');
      print("Error sending password reset email: $e");
    }
  }
}
