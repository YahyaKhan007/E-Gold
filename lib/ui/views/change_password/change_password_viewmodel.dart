import 'package:e_gold/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final navigationService = locator<NavigationService>();

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  void onPressedChange() {
    navigationService.back();
  }
}
