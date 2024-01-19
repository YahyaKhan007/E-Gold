import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
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

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  void onPressedLogin() {
    navigationService.navigateToDashboardScreenView();
    // if (formKey.currentState!.validate()) {
    //   navigationService.replaceWithHomeView();
    // }
  }

  String? signInEmailValidator(value) {
    if (emailController.text.isEmpty) {
      return 'Email or Phone is not entered.';
    }
    return null;
  }

  String? signInPasswordValidator(value) {
    if (passwordController.text.isEmpty) {
      return 'Password is not entered.';
    }
    if (passwordController.text.length < 5) {
      return 'Password too short.';
    }
    return null;
  }

  void onPressedCreateNewAccount() {
    navigationService.navigateToCreateanaccountView();
  }

  handleButtonPress(int i) {}
}
