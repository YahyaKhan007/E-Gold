import 'dart:async';

import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddCryptoScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }

  void viewTransaction() {
    _navigationService.navigateToTransactionScreenView();
  }
}
