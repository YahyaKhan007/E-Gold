import 'package:e_gold/app/app.locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CardPaymentScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final TextEditingController amount = TextEditingController();
  final TextEditingController cardCurrency = TextEditingController();

  void goBack() {
    _navigationService.back();
  }
}
