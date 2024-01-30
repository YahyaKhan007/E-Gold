import 'package:e_gold/app/app.dialogs.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyGoldOrSilverViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final bankService = locator<BankService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();

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

  void toContinue() async {
    if (amount.isEmpty) {
      _snackbarService.showSnackbar(
        message: 'Enter Some amount',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    } else {
      // try {
      //   bool isAmountGreaterThanBalance =
      //       await bankService.checkBalance(int.parse(amount).toDouble());
      //   if (isAmountGreaterThanBalance) {
      //     _snackbarService.showSnackbar(
      //       message: 'Entered amount is not in your app\'s balance',
      //       title: 'Alert',
      //       duration: const Duration(seconds: 2),
      //     );
      //     Future.delayed(const Duration(seconds: 2), () {
      //       _navigationService.navigateToDepositScreenView();
      //     });
      //   } else {
      //     _dialogService.showCustomDialog(
      //       variant: DialogType.buyDialog,
      //       data: int.parse(amount),
      //     );
      //     amount = '';
      //     rebuildUi();
      //   }
      // } catch (e) {
      //   _snackbarService.showSnackbar(
      //     message: 'Error $e',
      //     title: 'Error',
      //     duration: const Duration(seconds: 2),
      //   );
      //   amount = '';
      //   rebuildUi();
      // }
    }
  }
}
