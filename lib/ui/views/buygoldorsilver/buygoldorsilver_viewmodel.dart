import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyGoldOrSilverViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String amount = '';
  bool gold = true;

  void goldVal() {
    gold = true;
    rebuildUi();
  }

  void silverVal() {
    gold = false;
    rebuildUi();
  }

  void onKeyboardTap(String value) {
    amount = amount + value;
    rebuildUi();
  }

  void rightButtonfn() {
    if (amount.isNotEmpty) {
      amount = amount.substring(0, amount.length - 1);
      rebuildUi();
    }
  }

  void rightButtonLongfn() {
    if (amount.isNotEmpty) {
      amount = '';
      rebuildUi();
    }
  }

  void toContinue() {
    _navigationService.navigateToDepositScreenView();
  }
}
