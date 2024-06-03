import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/auth_service.dart';

class ConfirmDialogDialogModel extends BaseViewModel {
  ConfirmDialogDialogModel({required this.completer});

  final _authService = locator<AuthService>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  final Function(DialogResponse) completer;
  final passwordContoller = TextEditingController();

  void onYes() async {
    await deleteAccount();

    completer(DialogResponse(confirmed: true));

    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> deleteAccount() async {
    setBusy(true);

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String email = user.email!;
        String password = passwordContoller.text.trim();

        // Re-authenticate the user
        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await user.reauthenticateWithCredential(credential);

        // Delete user document from Firestore
        await _firestore.collection('users').doc(user.uid).delete();

        // Delete user authentication
        await user.delete();

        log('User account and document deleted successfully');
        // You can also navigate back or show a confirmation dialog here
      } else {
        log('No user is currently signed in');
      }
    } catch (e) {
      log('Error deleting user and document: $e');
    } finally {
      setBusy(false);
    }
  }
}
