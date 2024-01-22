import 'package:e_gold/ui/views/account_screen/account_screen_view.dart';
import 'package:e_gold/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class DashboardScreenViewModel extends BaseViewModel {
  final List<Widget> pages = [
    const HomeView(),
    Container(
      child: Center(child: Text("PROFILE SCREEN1")),
    ),
    Container(
      child: Center(child: Text("OCR SCREEN")),
    ),
    Container(
      child: Center(child: Text("PROFILE SCREEN3")),
    ),
    AccountScreenView(),
  ];
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  void pageChange(int nextIndex) {
    currentPageIndex = nextIndex;
    rebuildUi();
  }
}
