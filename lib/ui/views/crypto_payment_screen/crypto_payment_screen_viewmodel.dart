import 'package:e_gold/app/app.dialogs.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

import '../../../services/kyc_service.dart';

class CryptoPaymentScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final kycService = locator<KycService>();

  final TextEditingController walletAddress = TextEditingController();
  final TextEditingController securityPin = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();
  final _cryptoService = locator<CryptoService>();

  void goBack() {
    _navigationService.back();
  }

  String? customValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null when validation passes
  }

  void addBalance() async {
    if (await kycService.isKycApproved()) {
      bool check = await _cryptoService.doesCryptoCollectionExist();
      if (check) {
        _dialogService.showCustomDialog(
          variant: DialogType.addAmountForBalance,
          data: 'Crypto',
        );
      } else {
        _snackbarService.showSnackbar(
          message: 'Please enter Wallet details',
          title: 'Wallet Not Found',
          duration: const Duration(seconds: 2),
        );
      }
    } else {
      _snackbarService.showSnackbar(
        message:
            'Please Go to KYC Section and enter KYC details and wait for approval ',
        title: 'KYC Not Found',
        duration: const Duration(seconds: 2),
      );
    }
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void onViewModelReady() async {
    setBusy(true);
    bool check = await _cryptoService.doesCryptoCollectionExist();
    if (check) {
      walletAddress.text = _cryptoService.cryptoData!.walletAddress;
      securityPin.text = _cryptoService.cryptoData!.securityPin;
    }
    setBusy(false);
  }

  void toContinue(BuildContext context) async {
    // _navigationService.navigateToAddCryptoScreenView();
    if (await kycService.isKycApproved()) {
      if (validateForm()) {
        Crypto cryptoData = Crypto(
          walletAddress: walletAddress.text.toString(),
          securityPin: securityPin.text.toString(),
        );
        try {
          bool success = await _cryptoService.addCryptoToWallet(cryptoData);
          if (success) {
            _snackbarService.showSnackbar(
              message: 'Crypto added Successfully',
              title: 'Success',
              duration: const Duration(seconds: 2),
            );
          } else {
            _snackbarService.showSnackbar(
              message: 'There were problems adding Crypto',
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
        Navigator.pop(context);
      }
    } else {
      _snackbarService.showSnackbar(
        message:
            'Please Go to KYC Section and enter KYC details and wait for approval ',
        title: 'KYC Not Found',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
