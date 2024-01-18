import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  bool isPasswordVisible = false;
  bool isConformPasswordVisible = false;

  final navigationService = locator<NavigationService>();

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  void showConfirmPassword() {
    isConformPasswordVisible = !isConformPasswordVisible;
    rebuildUi();
  }

  void onPressedSignup() {
    if (formKey.currentState!.validate()) {}
  }

  String? signUpEmailValidator(String? value) {
    return !emailRegExp.hasMatch(value!)
        ? 'Invalid email addres.'
        : 'Please enter your email.';
  }

  String? signUpPasswordValidator(value) {
    if (emailController.text.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  String? signUpConfirmPasswordValidator(value) {
    if (conformPasswordController.text.isEmpty) {
      return 'Please enter confirm password';
    }

    return null;
  }

  String? signUpPhoneValidator(String? value) {
    return null;
  }

  void onPressedAlreadyHaveAnAccount() {
    navigationService.replaceWithLoginView();
  }
}
