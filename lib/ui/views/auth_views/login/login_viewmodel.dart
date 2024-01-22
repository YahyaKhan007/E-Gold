import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<IconData> iconData = [
    MdiIcons.google,
    MdiIcons.facebook,
    MdiIcons.apple,
  ];

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = false;
  final navigationService = locator<NavigationService>();

  final _authService = locator<AuthService>();
  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  // void onPressedLogin() {
  //   navigationService.navigateToDashboardScreenView();
  //   // if (formKey.currentState!.validate()) {
  //   //   navigationService.replaceWithHomeView();
  //   // }
  void onPressedLogin() {
    navigationService.navigateToDashboardScreenView();
    // if (formKey.currentState!.validate()) {
    //   navigationService.replaceWithHomeView();
    // }
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onPressedLogin() async {
    if (validateForm()) {
      User? user = await _authService.signInWithEmailPassword(
          emailController.text.trim(), passwordController.text.trim());

      if (user != null) {
        navigationService.navigateToKycView();
      }
    }
  }

  void onPressedCreateNewAccount() {
    navigationService.navigateToCreateanaccountView();
  }

  handleButtonPress(int i) {}
}
