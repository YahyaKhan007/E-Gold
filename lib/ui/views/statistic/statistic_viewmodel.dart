import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StatisticViewModel extends BaseViewModel {
  int? selectedValue = 1;

  void onButtonPressed() {}

  void onButtonPressedDropDown(value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectedValue = value;
      rebuildUi();
    });
  }
}
