// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/inStore_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../models/bank.dart';
import '../../../../models/crypto.dart';
import '../../../../models/inStore.dart';
import '../../../../models/kyc.dart';
import '../../../../models/userProfile.dart';
import '../../../../services/kyc_service.dart';
import '../../../../services/userProfileService.dart';

enum Status { Success, Error, Cancelled }

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<IconData> iconData = [
    MdiIcons.google,
    MdiIcons.facebook,
    MdiIcons.apple,
  ];

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = true;
  final navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final userProfileService = locator<UserProfileService>();
  final _transactionService = locator<TransactionDetailsService>();
  final bankService = locator<BankService>();
  final cryptoService = locator<CryptoService>();
  final inStoreService = locator<InStoreService>();
  final balanceService = locator<BalanceService>();
  final _kycService = locator<KycService>();
  final _snackbarService = locator<SnackbarService>();

  void onGoogleLogin(BuildContext context) async {
    try {
      var userCred = await _authService.signInWithGoogle();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      var user = userCred.user;

      if (user != null) {
        if (userCred.additionalUserInfo!.isNewUser) {
          UserProfile user = UserProfile(
              totalGoldHoldings: 0.0,
              isAdmin: false,
              name: userCred.user!.displayName.toString(),
              profileImg: '',
              countryCode: '',
              email: userCred.user!.email.toString(),
              uid: userCred.user!.uid.toString(),
              phoneNumber: "",
              dateOfBirth: '',
              lastDayGoldPrice: 0.0,
              createdAt: Timestamp.now());
          Crypto cryptoData = Crypto(walletAddress: '', securityPin: '');
          Bank bankData = Bank(bankName: '', accountNumber: '', swiftCode: '');
          InStore instoreData = InStore(uid: userCred.user!.uid, balance: 0.0);
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
          await userProfileService.addUserToFirestore(user);
          await userProfileService.getUser();
          await balanceService.createBalance(
              FirebaseAuth.instance.currentUser!.uid, 0.0, 0.0);
          await _kycService.saveKYCData(kycData);
          await cryptoService.addCryptoToWallet(cryptoData);
          await bankService.addBankToWallet(bankData);
          await inStoreService.addInStoreToWallet(instoreData);

          await userProfileService.getUser();
          await bankService.getBankData();
          await cryptoService.getCryptoData();
          await inStoreService.getInStoreData();
          await balanceService
              .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
          await _transactionService.getAllTransactionDetails(user.uid);

          Navigator.pop(context);
          navigationService.replaceWithDashboardScreenView();

          // _showSuccessSnackbar('Sign-up successful! Verification email sent.');
        } else {
          await userProfileService.getUser();
          await bankService.getBankData();
          await cryptoService.getCryptoData();
          await inStoreService.getInStoreData();
          await balanceService
              .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
          await _transactionService.getAllTransactionDetails(user.uid);
          Navigator.pop(context);
          navigationService.replaceWithDashboardScreenView();
        }
      }
    } catch (e, stackTrace) {
      log("stackTrace: $stackTrace");
    }
  }

  void onFacebookLogin(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookCredential);

          if (userCredential.user != null) {
            if (userCredential.additionalUserInfo!.isNewUser) {
              UserProfile user = UserProfile(
                  totalGoldHoldings: 0.0,
                  isAdmin: false,
                  name: userCredential.user!.displayName.toString(),
                  profileImg: '',
                  countryCode: '',
                  email: userCredential.user!.email.toString(),
                  uid: userCredential.user!.uid.toString(),
                  phoneNumber: "",
                  dateOfBirth: '',
                  lastDayGoldPrice: 0.0,
                  createdAt: Timestamp.now());
              Crypto cryptoData = Crypto(walletAddress: '', securityPin: '');
              Bank bankData =
                  Bank(bankName: '', accountNumber: '', swiftCode: '');
              InStore instoreData =
                  InStore(uid: userCredential.user!.uid, balance: 0.0);
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
              await userProfileService.addUserToFirestore(user);
              await userProfileService.getUser();
              await balanceService.createBalance(
                  FirebaseAuth.instance.currentUser!.uid, 0.0, 0.0);
              await _kycService.saveKYCData(kycData);
              await cryptoService.addCryptoToWallet(cryptoData);
              await bankService.addBankToWallet(bankData);
              await inStoreService.addInStoreToWallet(instoreData);

              await userProfileService.getUser();
              await bankService.getBankData();
              await cryptoService.getCryptoData();
              await inStoreService.getInStoreData();
              await balanceService
                  .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
              await _transactionService.getAllTransactionDetails(user.uid);

              Navigator.pop(context);
              navigationService.replaceWithDashboardScreenView();

              // _showSuccessSnackbar('Sign-up successful! Verification email sent.');
            } else {
              await userProfileService.getUser();
              await bankService.getBankData();
              await cryptoService.getCryptoData();
              await inStoreService.getInStoreData();
              await balanceService
                  .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
              await _transactionService
                  .getAllTransactionDetails(userCredential.user!.uid);
              Navigator.pop(context);
              navigationService.replaceWithDashboardScreenView();
            }
          }

          break;
        default:
          Navigator.pop(context);

          return;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
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

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onPressedLogin() async {
    if (validateForm()) {
      User? user = await _authService.signInWithEmailPassword(
          emailController.text.trim(), passwordController.text.trim());
      if (user != null) {
        await userProfileService.getUser();
        await bankService.getBankData();
        await cryptoService.getCryptoData();
        await inStoreService.getInStoreData();
        await balanceService
            .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
        await _transactionService.getAllTransactionDetails(user.uid);
        navigationService.replaceWithDashboardScreenView();
      }
    }
  }

  void onPressedCreateNewAccount() {
    navigationService.navigateToCreateanaccountView();
  }

  handleButtonPress(int i, BuildContext context) {
    switch (i) {
      case 0:
        log('Google');
        onGoogleLogin(context);
        return;

      case 1:
        onFacebookLogin(context);
        return;
    }
  }
}
