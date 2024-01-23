import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class KycViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int currentPage = 0;

  void onViewModelReady() async {
    setBusy(true);

    setBusy(false);
  }

  void onPageChanged(int value) {
    currentPage = value;
    rebuildUi();
  }
}
