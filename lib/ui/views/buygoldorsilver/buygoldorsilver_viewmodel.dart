import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BuygoldorsilverViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int value) {
    currentPage = value;
    rebuildUi();
  }

  void onGoldButtonPressed() {}

  void onSilverButtonPressed() {}
}
