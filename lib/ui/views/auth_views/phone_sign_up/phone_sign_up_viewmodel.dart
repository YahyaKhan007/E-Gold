import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneSignUpViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String initialCountry = 'US';

  final navigationService = locator<NavigationService>();

  final authService = locator<AuthService>();
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  final TextEditingController phoneController = TextEditingController();

  void onPressedSubmit() {
    if (validateForm()) {
      authService.verifyPhoneNumber("+923038517959");
      navigationService.navigateToOtpverificationView();
    }
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
