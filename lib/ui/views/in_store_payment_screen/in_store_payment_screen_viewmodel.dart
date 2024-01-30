import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InStorePaymentScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final TextEditingController uid = TextEditingController();
  final userService = locator<UserProfileService>();

  void onViewModelReady() {
    setBusy(true);
    uid.text = userService.user!.uid;
    setBusy(false);
  }

  void goBack() {
    _navigationService.back();
  }
}
