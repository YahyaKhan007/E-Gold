import 'dart:developer';

import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/ui/views/auth_views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class CreateanaccountViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final authService = locator<AuthService>();
  final LoginViewModel loginViewModel = LoginViewModel();
  final List<Map<String, dynamic>> buttonData = [
    {'text': 'Continue with Phone', 'icon': 'assets/icons/smartphone.svg'},
    {'text': 'Continue with Apple', 'icon': 'assets/icons/apple_logo.svg'},
    {'text': 'Continue with Google', 'icon': 'assets/icons/google.svg'},
    {
      'text': 'Continue with Facebook',
      'icon': 'assets/icons/facebook_circled.svg'
    },
  ];

  handleButtonPress(
    BuildContext context,
    int buttonNumber,
  ) {
    if (buttonNumber == 0) {
      _navigator.navigateToPhoneSignUpView();
    }
    if (buttonNumber == 1) {
      _navigator.navigateToSignupView();
    }
    if (buttonNumber == 2) {
      // log('Google');
      // onTapGoogleSignIn();
      loginViewModel.onGoogleLogin(context);
    }
    if (buttonNumber == 3) {
      // onTapFacebook();
      loginViewModel.onFacebookLogin(context);
    }
  }

  void onTapGoogleSignIn() async {
    await authService.signInWithGoogle();
  }

  void onButtonPressed() {
    _navigator.replaceWithLoginView();
  }

  void onTapFacebook() async {
    // await authService.signInWithFacebook();
    // onFacebookLogin(context);
  }

  void onPressedSignup() {
    _navigator.replaceWithSignupView();
  }

  void onPressedLogin() {
    _navigator.replaceWithLoginView();
  }
}
