import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/ui/views/account_screen/account_screen_view.dart';
import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_view.dart';
import 'package:e_gold/ui/views/choose_payment_method/choose_payment_method_view.dart';
import 'package:e_gold/ui/views/home/home_view.dart';
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class DashboardScreenViewModel extends BaseViewModel {
  final bankService = locator<BankService>();
  final cryptoService = locator<CryptoService>();
  final List<Widget> pages = [
    const HomeView(),
    const TransactionHistoryScreenView(check: false),
    const ChoosePaymentMethodView(),
    const Center(child: Text("PROFILE SCREEN3")),
    const AccountScreenView(),
  ];
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  void pageChange(int nextIndex) {
    currentPageIndex = nextIndex;
    rebuildUi();
  }
}
