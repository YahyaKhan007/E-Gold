import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../services/userProfileService.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<IconData> iconData = [
    MdiIcons.google,
    MdiIcons.facebook,
    MdiIcons.apple,
  ];

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = true;
  final navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final userProfileService = locator<UserProfileService>();
  final _transactionService = locator<TransactionDetailsService>();
  final bankService = locator<BankService>();
  final cryptoService = locator<CryptoService>();

  void showPassword() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onPressedLogin() async {
    if (validateForm()) {
      User? user = await _authService.signInWithEmailPassword(
          emailController.text.trim(), passwordController.text.trim());
      if (user != null) {
        await userProfileService.getUser();
        await bankService.getBankData();
        await cryptoService.getCryptoData();
        await _transactionService.getAllTransactionDetails(user.uid);
        navigationService.replaceWithDashboardScreenView();
      }
    }
  }

  void onPressedCreateNewAccount() {
    navigationService.navigateToCreateanaccountView();
  }

  handleButtonPress(int i) {}
}
