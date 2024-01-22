import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  bool isPasswordVisible = false;
  bool isConformPasswordVisible = false;
  final _authService = locator<AuthService>();
  final navigationService = locator<NavigationService>();

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  void showConfirmPassword() {
    isConformPasswordVisible = !isConformPasswordVisible;
    rebuildUi();
  }

  String? signUpPhoneValidator(String? value) {
    return null;
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onPressedAlreadyHaveAnAccount() {
    navigationService.replaceWithLoginView();
  }

  void onTapSignUp() async {
    if (validateForm()) {
      User? user = await _authService.signUpWithEmail(
          emailController.text.trim(),
          passwordController.text.trim(),
          nameController.text);

      if (user != null) {
        navigationService.navigateToLoginView();
      }
    }
  }
}
