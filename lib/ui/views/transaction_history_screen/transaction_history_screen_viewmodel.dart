import 'dart:developer';

import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/transactionDetails.dart';
import '../home/home_viewmodel.dart';

class TransactionHistoryScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final transactionService = locator<TransactionDetailsService>();
  final _userService = locator<UserProfileService>();
  final ScrollController scrollController = ScrollController();
  List<TransactionDetails> sortedList = List.empty(growable: true);
  final _transactionService = locator<TransactionDetailsService>();

  List<TransactionDetails> cryptoTransactions = [];
  List<TransactionDetails> cardTransactions = [];
  List<TransactionDetails> bankTransactions = [];
  List<TransactionDetails> inStoreTransactions = [];
  List<TransactionDetails> marginTransactionList = [];

  String isSelected = 'All';

  void changeSelection({required String selection}) {
    isSelected = selection;
    rebuildUi();

    log("selected  is ==== >   $isSelected");
  }

  void onViewModelReady() async {
    setBusy(true);

    final transactionDetails = await transactionService
        .getAllTransactionDetails(_userService.user!.uid);
    await fetchTransactions();
    sortedList.addAll(transactionDetails
        .where((item) => item.transactionType != 'Sell')
        .toList());
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

  void goBack() {
    _navigationService.back();
  }

  String image(TransactionDetails transaction) {
    if (transaction.walletType == 'Bank') {
      return bank;
    } else if (transaction.walletType == 'Crypto') {
      return crypto;
    } else if (transaction.walletType == 'In-Store') {
      return store;
    } else if (transaction.walletType == 'Card') {
      return card;
    } else {
      return 'default_image.png';
    }
  }

  Future<void> refreshData() async {
    await transactionService.getAllTransactionDetails(_userService.user!.uid);
    rebuildUi();
  }
}
