// ignore_for_file: use_build_context_synchronously, unused_element, unused_local_variable, unused_import, duplicate_import

import 'dart:async';
import 'dart:developer';
import 'dart:io';

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
import 'package:flutter/services.dart';
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
  Timer? serverConnectionTimer;
  final metalPriceService = locator<MetalPriceService>();
  List<TransactionDetails> cryptoTransactions = [];
  List<TransactionDetails> cardTransactions = [];
  List<TransactionDetails> bankTransactions = [];
  List<TransactionDetails> inStoreTransactions = [];
  List<TransactionDetails> marginTransactionList = [];
  final _bottomService = locator<BottomSheetService>();

  final ScrollController mainScrollController = ScrollController();

  String isSelected = 'Bank';

  double calculateProfitLoss(
      {required double gramsBought,
      required double buyRate,
      required double sellRate,
      required double conversionRate}) {
    double buyAmount = gramsBought * buyRate;
    double sellAmount = gramsBought * sellRate;
    // double buyInTola = gramsBought / conversionRate;
    double profitLoss = sellAmount - buyAmount;

    // Convert to tola for display purposes
    // double profitLossInTola = profitLoss / conversionRate;

    // print(
    //     'Bought $gramsBought grams of gold at $buyRate per gram for $buyAmount');
    // print('Sold for $sellRate per gram for $sellAmount');
    // print('Profit/Loss: $profitLoss grams or $profitLossInTola tola');

    return profitLoss;
  }

  void changeSelection({required String selection}) {
    isSelected = selection;
    rebuildUi();
    log("selected  is ==== >   $isSelected");
  }

  void _startServerConnectionTimer() {
    // Start a timer that calls connectToServer every 5 minutes
    serverConnectionTimer =
        Timer.periodic(const Duration(seconds: 20), (timer) {
      connectToServer();
      log('Text 1');
    });
  }

  void connectToServer() async {
    try {
      // Establish connection with the server
      int port = 57578;
      Socket socket = await Socket.connect('165.73.253.101', port);

      // Update isConnected state to true
      // setState(() {
      //   isConnected = true;
      // });

      // Listen for data from the server
      socket.listen(
        (Uint8List data) {
          currentGoldRate = double.parse(String.fromCharCodes(data).trim());
          rebuildUi();
          for (var transaction in marginTransactionList) {
            totalMarginProfit += calculateProfitLoss(
                gramsBought: transaction.totalGoldBought,
                buyRate: transaction.buyGoldRate,
                sellRate: currentGoldRate,
                conversionRate: conversionFactor);
          }
          rebuildUi();
          // setState(() {
          //   serverResponse = String.fromCharCodes(data).trim();
          // });
        },
      );

      // Close the connection
      // socket.close();
    } catch (e) {
      print('Error: $e');
    }
  }

  double calculateResult({required double passedValue}) {
    return passedValue / walletLimit;
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
    calulateMarginFromTransationsPortFolio();
    _startServerConnectionTimer();
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

  calulateMarginFromTransationsPortFolio() {
    if (inStoreTransactions.isNotEmpty) {
      for (var transaction in inStoreTransactions) {
        if (transaction.isMargin == true && transaction.isSold == false) {
          marginTransactionList.add(transaction);
        }
      }
    } else if (cardTransactions.isNotEmpty) {
      for (var transaction in cardTransactions) {
        if (transaction.isMargin == true && transaction.isSold == false) {
          marginTransactionList.add(transaction);
        }
      }
    } else if (bankTransactions.isNotEmpty) {
      for (var transaction in bankTransactions) {
        if (transaction.isMargin == true && transaction.isSold == false) {
          marginTransactionList.add(transaction);
        }
      }
    } else if (cryptoTransactions.isNotEmpty) {
      for (var transaction in cryptoTransactions) {
        if (transaction.isMargin == true && transaction.isSold == false) {
          marginTransactionList.add(transaction);
        }
      }
    }

    log('Total Margin Transaction List Length is : ${marginTransactionList.length}');
  }

  void onTapSell() {
    _bottomService.showCustomSheet(
      variant: BottomSheetType.sellgold,
    );
  }

  void onTapEditProfile() {
    navigationService.navigateToTransactionHistoryScreenView;
  }

  void _stopServerConnectionTimer() {
    // Cancel the timer when no longer needed
    serverConnectionTimer?.cancel();
  }

  @override
  void dispose() {
    // Dispose of resources when the ViewModel is disposed
    _stopServerConnectionTimer();
    super.dispose();
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
