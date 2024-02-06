import 'dart:ui';

import 'package:e_gold/app/app.dialogs.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/bank.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class LinkBankAccountScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController bankName = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController accountSwiftCode = TextEditingController();
  final _bankService = locator<BankService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();

  void goBack() {
    _navigationService.back();
  }

  void onViewModelReady() async {
    setBusy(true);
    bool check = await _bankService.doesBankCollectionExist();
    print(check);
    if (check) {
      bankName.text = _bankService.bankData!.bankName;
      accountNumber.text = _bankService.bankData!.accountNumber;
      accountSwiftCode.text = _bankService.bankData!.swiftCode;
    }
    setBusy(false);
  }

  String? customValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null when validation passes
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void addBalance() async {
    bool check = await _bankService.doesBankCollectionExist();
    if (check) {
      _dialogService.showCustomDialog(
        variant: DialogType.addAmountForBalance,
        data: 'Bank',
      );
    }
  }

  void linkAccount() async {
    if (validateForm()) {
      Bank bankData = Bank(
        bankName: bankName.text.toString(),
        accountNumber: accountNumber.text.toString(),
        swiftCode: accountSwiftCode.text.toString(),
      );
      try {
        bool success = await _bankService.addBankToWallet(bankData);
        if (success) {
          _snackbarService.showSnackbar(
            message: 'Bank Linked Successfully',
            title: 'Success',
            duration: const Duration(seconds: 2),
          );
        } else {
          _snackbarService.showSnackbar(
            message: 'There were problems Linking Account',
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
      _navigationService.back();
    }
  }
}
