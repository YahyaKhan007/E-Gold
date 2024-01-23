import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  bool isPasswordVisible = true;
  final navigationService = locator<NavigationService>();

  final authService = locator<AuthService>();
  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      authService.changePasswordWithCurrentPassword(
          currentPasswordController.text, passwordController.text);
      navigationService.back();
    }
  }
}
