import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/inStore_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChoosePaymentMethodViewModel extends BaseViewModel {
  final crytpoService = locator<CryptoService>();
  final _navigationService = locator<NavigationService>();
  final balanceService = locator<BalanceService>();
  final inStoreService = locator<InStoreService>();
  final transactionDetailsService = locator<TransactionDetailsService>();
  final bankService = locator<BankService>();
  final snackbarService = locator<SnackbarService>();

  void goBack() {
    _navigationService.back();
  }

  void openBuyInStore() async {
    bool check = await inStoreService.doesInStoreCollectionExist();
    print('Check');
    if (check) {
      _navigationService.navigateToBuyGoldOrSilverView(
          withdrawMethod: "In-Store",
          balance: inStoreService.instoreData!.balance.toString(),
          margin: inStoreService.instoreData!.margin.toString());
    } else {
      _navigationService.navigateToBuyGoldOrSilverView(
          withdrawMethod: "In-Store", balance: "0.0", margin: '0.0');
    }
  }

  void openBuyCard() {
    _navigationService.navigateToBuyGoldOrSilverView(
        withdrawMethod: "Card", balance: " 32", margin: ' 32');
  }

  void openBuyCrypto() async {
    bool check = await crytpoService.doesCryptoCollectionExist();
    print('Check');
    if (check) {
      _navigationService.navigateToBuyGoldOrSilverView(
          balance: crytpoService.cryptoData!.balance.toString(),
          withdrawMethod: "Crypto",
          margin: crytpoService.cryptoData!.margin.toString());
    } else {
      _navigationService.navigateToBuyGoldOrSilverView(
          balance: '0.0', withdrawMethod: "Crypto", margin: '0.0');
    }
  }

  void openBuyBank() async {
    bool check = await bankService.doesBankCollectionExist();
    print('Check');
    if (check) {
      _navigationService.navigateToBuyGoldOrSilverView(
          withdrawMethod: "Bank",
          balance: bankService.bankData!.balance.toString(),
          margin: bankService.bankData!.margin.toString());
    } else {
      _navigationService.navigateToBuyGoldOrSilverView(
          withdrawMethod: "Bank", balance: '0.0', margin: '0.0');
    }
  }
}
