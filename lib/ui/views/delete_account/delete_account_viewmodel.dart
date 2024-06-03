import 'dart:developer';

import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteAccountViewModel extends BaseViewModel {
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final navigationService = locator<NavigationService>();
  final snackbarServices = locator<SnackbarService>();

  bool isEmailPasswordUser = false;

  DeleteAccountViewModel() {
    _checkAuthProvider();
  }

  Future<void> _checkAuthProvider() async {
    User? user = _auth.currentUser;
    if (user != null &&
        user.providerData.any((info) => info.providerId == 'password')) {
      isEmailPasswordUser = true;
    }
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    setBusy(true);

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        if (user.providerData.any((info) => info.providerId == 'password')) {
          // Email/password re-authentication
          String email = user.email!;
          String password = passwordController.text.trim();

          AuthCredential credential =
              EmailAuthProvider.credential(email: email, password: password);
          await user.reauthenticateWithCredential(credential);
        } else if (user.providerData
            .any((info) => info.providerId == 'google.com')) {
          // Google re-authentication
          GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
          if (googleUser != null) {
            GoogleSignInAuthentication googleAuth =
                await googleUser.authentication;
            AuthCredential credential = GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken,
            );
            await user.reauthenticateWithCredential(credential);
          } else {
            log('Google sign-in was canceled');
            return;
          }
        } else {
          log('Unsupported authentication provider');
          return;
        }

        // Delete user document from Firestore
        await _firestore.collection('users').doc(user.uid).delete();

        // Delete user authentication
        await user.delete();

        navigationService.clearStackAndShow(Routes.loginView);

        log('User account and document deleted successfully');
        snackbarServices.showSnackbar(
            message: "Account Deleted Successfully",
            duration: const Duration(seconds: 2));
        // You can also navigate back or show a confirmation dialog here
      } else {
        log('No user is currently signed in');
      }
    } catch (e) {
      setBusy(false);

      log('Error deleting user and document: $e');
      snackbarServices.showSnackbar(
          message: "Check your password and try again",
          duration: const Duration(seconds: 2));
    } finally {
      setBusy(false);
    }
  }

  void onBack() {
    navigationService.back();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
