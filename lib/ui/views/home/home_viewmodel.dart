import 'package:e_gold/app/app.bottomsheets.dart';
import 'package:e_gold/app/app.dialogs.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/liveGoldSerice.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _transactionService = locator<TransactionDetailsService>();
  
  final metalPriceService = locator<MetalPriceService>();
  List<TransactionDetails> cryptoTransactions = [];
  List<TransactionDetails> cardTransactions = [];
  List<TransactionDetails> bankTransactions = [];
  List<TransactionDetails> inStoreTransactions = [];
  final _bottomService = locator<BottomSheetService>();

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
