import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class ForgetpasswordViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String initialCountry = 'US';

  final navigationService = locator<NavigationService>();

  final authService = locator<AuthService>();
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  final TextEditingController emailController = TextEditingController();

  void onPressedSubmit() {
    if (validateForm()) {
      authService.resetPassword(emailController.text.trim());
      navigationService.navigateToLoginView();
    }
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onTapSignIn() {
    navigationService.navigateToLoginView();
  }
}
