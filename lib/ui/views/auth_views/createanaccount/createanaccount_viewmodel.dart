import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class CreateanaccountViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final authService = locator<AuthService>();
  final List<Map<String, dynamic>> buttonData = [
    {'text': 'Continue with Phone', 'icon': 'assets/icons/smartphone.svg'},
    {'text': 'Continue with Apple', 'icon': 'assets/icons/apple_logo.svg'},
    {'text': 'Continue with Google', 'icon': 'assets/icons/google.svg'},
    {
      'text': 'Continue with Facebook',
      'icon': 'assets/icons/facebook_circled.svg'
    },
  ];

  handleButtonPress(int buttonNumber) {
    if (buttonNumber == 0) {
      _navigator.navigateToPhoneSignUpView();
    }
    if (buttonNumber == 1) {
      _navigator.navigateToSignupView();
    }
    if (buttonNumber == 2) {
      onTapGoogleSignIn();
    }
    if (buttonNumber == 3) {
      onTapFacebook();
    }
  }

  void onTapGoogleSignIn() async {
    await authService.signInWithGoogle();
  }

  void onButtonPressed() {
    _navigator.replaceWithLoginView();
  }

  void onTapFacebook() async {
    await authService.signInWithFacebook();
  }

  void onPressedSignup() {
    _navigator.replaceWithSignupView();
  }

  void onPressedLogin() {
    _navigator.replaceWithLoginView();
  }
}
