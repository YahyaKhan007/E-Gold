import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _snackbarService = locator<SnackbarService>();

  // Future<User?> signUpWithEmail(
  //     String email, String password, String name) async {
  //   try {
  //     final credential = await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     await _saveUserProfileToFirestore(credential.user, name);
  //     _showSuccessSnackbar('Sign-up successful!');
  //     return credential.user;
  //   } on FirebaseAuthException catch (e) {
  //     _handleAuthException(e);
  //   } catch (e) {
  //     _handleGeneralException(e);
  //   }
  //   return null;
  // }

  // Future<void> _saveUserProfileToFirestore(User? user, String name) async {
  //   if (user != null) {
  //     // Reference to the Firestore collection where user profiles are stored
  //     CollectionReference users =
  //         FirebaseFirestore.instance.collection('users');

  //     // Create a document for the user using their UID
  //     await users.doc(user.uid).set({
  //       'uid': user.uid,
  //       'email': user.email,
  //       'name':
  //           name, // Add user's name or any other information you want to store
  //       // Add other fields as needed
  //     });
  //   }
  // }
  Future<User?> signUpWithEmail(
      String email, String password, String name) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      await credential.user?.sendEmailVerification();

      // Save user profile to Firestore
      await _saveUserProfileToFirestore(credential.user, name);

      _showSuccessSnackbar('Sign-up successful! Verification email sent.');
      return credential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    } catch (e) {
      _handleGeneralException(e);
    }
    return null;
  }

  Future<void> _saveUserProfileToFirestore(User? user, String name) async {
    if (user != null) {
      // Reference to the Firestore collection where user profiles are stored
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Create a document for the user using their UID
      await users.doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'name': name,
        // Add other fields as needed
      });
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
    await _auth.signOut();
    await _googleSignIn.signOut();
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
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
