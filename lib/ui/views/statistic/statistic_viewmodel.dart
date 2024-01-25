import 'package:flutter/material.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StatisticViewModel extends BaseViewModel {
  int? selectedValue = 1;

  void onButtonPressed() {}

  void onButtonPressedDropDown(value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectedValue = value;
      rebuildUi();
    });
  }
  final navigationService = locator<NavigationService>();
  void onButtonPressed() {
    navigationService.back();
  }
}
