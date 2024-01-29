import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class BuyDialogDialogModel extends BaseViewModel {
  final int amount;
  BuyDialogDialogModel({required this.amount});

  final bankService = locator<BankService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  void confirm() async {
    try {
      bool deductionSuccessful = await bankService.deductAmount(amount);
      if (deductionSuccessful) {
        _snackbarService.showSnackbar(
          message: 'Gold bough Successfully',
          title: 'Success',
          duration: const Duration(seconds: 2),
        );
      } else {
        _snackbarService.showSnackbar(
          message: 'Gold was not bought',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
        message: 'Error $e',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
    Future.delayed(const Duration(seconds: 3), () {
      _navigationService.back();
    });
  }

  void cancel(BuildContext context) {
    Navigator.pop(context);
  }
}
