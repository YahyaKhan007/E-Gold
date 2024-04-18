import 'dart:io';

import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/inStore_service.dart';
import 'package:e_gold/services/sales_and_purchase_service_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/app_strings.dart';

class StartupViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final salesAndPurchases = locator<SalesAndPurchaseServiceService>();
  final userProfileService = locator<UserProfileService>();
  final _transactionService = locator<TransactionDetailsService>();
  final inStoreService = locator<InStoreService>();
  bool isLogin = true;
  final bankService = locator<BankService>();
  final cryptoService = locator<CryptoService>();
  final balanceService = locator<BalanceService>();

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

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await userProfileService.getUser();
      await bankService.getBankData();
      await salesAndPurchases.getAllSandP();
      print(
          "Length of S and P documnets are :    ${salesAndPurchases.salesAndPurchasesList.length}");
      print(
          '///////////////////////////////////////////////////////////////////////////////////////////////////////////');
      await cryptoService.getCryptoData();
      await inStoreService.getInStoreData();
      await balanceService
          .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
      connectToServer();
      await _transactionService.getAllTransactionDetails(user.uid);
      navigationService.clearStackAndShow(Routes.dashboardScreenView);
    } else {
      navigationService.clearStackAndShow(Routes.loginView);
    }

    rebuildUi();
  }

  void getStarted() {
    navigationService.navigateToCreateanaccountView();
  }

  void onPressedAlreadyHaveAnAccount() {
    navigationService.replaceWithLoginView();
  }
}
