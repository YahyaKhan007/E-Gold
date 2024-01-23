import 'package:e_gold/ui/views/account_screen/account_screen_view.dart';
import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_view.dart';
import 'package:e_gold/ui/views/home/home_view.dart';
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class DashboardScreenViewModel extends BaseViewModel {
  final List<Widget> pages = [
    const HomeView(),
    const TransactionHistoryScreenView(check: false),
    const BuyGoldOrSilverView(),
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
