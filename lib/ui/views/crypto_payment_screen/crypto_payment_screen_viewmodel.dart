import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class CryptoPaymentScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final TextEditingController amount = TextEditingController();

  void goBack() {
    _navigationService.back();
  }

  void toContinue() {
    _navigationService.navigateToAddCryptoScreenView();
  }
}
