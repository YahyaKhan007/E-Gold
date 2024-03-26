// ignore_for_file: use_build_context_synchronously, unused_element, unused_local_variable, unused_import, duplicate_import

import 'dart:developer';

import 'package:e_gold/app/app.bottomsheets.dart';
import 'package:e_gold/app/app.dialogs.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/liveGoldSerice.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/balance_service.dart';
import '../../common/app_colors.dart';
import '../../common/app_images.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/customHomeTransactionRow.dart';
import '../transactiondetails/transactiondetails_view.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final navigationService = locator<NavigationService>();

  final _transactionService = locator<TransactionDetailsService>();

  final userService = locator<UserProfileService>();
  final balanceService = locator<BalanceService>();

  final metalPriceService = locator<MetalPriceService>();
  List<TransactionDetails> cryptoTransactions = [];
  List<TransactionDetails> cardTransactions = [];
  List<TransactionDetails> bankTransactions = [];
  List<TransactionDetails> inStoreTransactions = [];
  final _bottomService = locator<BottomSheetService>();

  final ScrollController mainScrollController = ScrollController();

  String isSelected = 'Card';
  void changeSelection({required String selection}) {
    isSelected = selection;
    rebuildUi();
    log("selected  is ==== >   $isSelected");
  }

  // *  Fetching transaction

  void seeAll() {
    _navigationService.navigateToTransactionHistoryScreenView(check: true);
  }

  void notification() {
    _navigationService.navigateToNotificationScreenView();
  }

  void goldContainer() {
    _navigationService.navigateToGoldbalancehistoryView();
  }

  void silverContainer() {
    _navigationService.navigateToSliverbalancehistoryView();
  }

  void onViewModelReady() async {
    setBusy(true);
    log("The model is being ready");
    if (userService.user == null) {
      await userService.getUser();
    }

    await balanceService.getBalanceData(userService.user!.uid);
    // await metalPriceService.fetchData();
    // fetchTransactionRow(transactionType: cryptoTransactions);
    await fetchTransactions();
    setBusy(false);
  }

  Future<void> fetchTransactions() async {
    try {
      cryptoTransactions = (await _transactionService
              .getTransactionsByPaymentMethod('userId', 'Crypto'))
          .cast<TransactionDetails>();
      cardTransactions = (await _transactionService
              .getTransactionsByPaymentMethod('userId', 'Card'))
          .cast<TransactionDetails>();
      bankTransactions = (await _transactionService
              .getTransactionsByPaymentMethod('userId', 'Bank'))
          .cast<TransactionDetails>();
      inStoreTransactions = (await _transactionService
              .getTransactionsByPaymentMethod('userId', 'In-Store'))
          .cast<TransactionDetails>();
      print('print data from fetch transaction');
      log("Transactions fetched successfully");
      // Notify listeners about the changes
      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error fetching transactions: $e');
    }
  }

  void onTapSell() {
    _bottomService.showCustomSheet(
      variant: BottomSheetType.sellgold,
    );
  }

  void onTapEditProfile() {
    navigationService.navigateToTransactionHistoryScreenView;
  }

  final PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  void navigateToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
    );
    currentPageIndex = pageIndex;
    rebuildUi();
  }
}
