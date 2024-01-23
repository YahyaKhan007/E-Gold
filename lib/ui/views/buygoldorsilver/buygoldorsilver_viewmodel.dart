import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BuyGoldOrSilverViewModel extends BaseViewModel {
  bool gold = true;

  void goldVal() {
    gold = true;
    rebuildUi();
  }

  void silverVal() {
    gold = false;
    rebuildUi();
  }
}
