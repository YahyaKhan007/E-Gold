import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BuyGoldOrSilverViewModel extends BaseViewModel {
  String amount = '';
  bool gold = true;

  void goldVal() {
    gold = true;
    rebuildUi();
  }

  void silverVal() {
    gold = false;
    rebuildUi();
  }

  void onKeyboardTap(String value) {
    amount = amount + value;
    rebuildUi();
  }

  void rightButtonfn() {
    if (amount.isNotEmpty) {
      amount = amount.substring(0, amount.length - 1);
      rebuildUi();
    }
  }

  void rightButtonLongfn() {
    if (amount.isNotEmpty) {
      amount = '';
      rebuildUi();
    }
  }
}
