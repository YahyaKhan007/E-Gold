import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/stripe_api.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChoosePaymentMethodViewModel extends BaseViewModel {
  final crytpoService = locator<CryptoService>();
  final _navigationService = locator<NavigationService>();
  Crypto? cryptoData;
  final balanceService = locator<BalanceService>();
  final stripeApi = locator<StripeApi>();
  void onViewModelReady() async {
    setBusy(true);
    cryptoData = await crytpoService.getCryptoFromWallet();
    setBusy(false);
  }

  Map<String, dynamic>? paymentIntent;
  final transactionDetailsService = locator<TransactionDetailsService>();

  final bankService = locator<BankService>();
  final snackbarService = locator<SnackbarService>();

  void goBack() {
    _navigationService.back();
  }

  void openBuyInstore() {
    _navigationService.navigateToBuyGoldOrSilverView(
        withdrawMethod: "In-Store", balance: "3232", margin: '3232');
  }

  void openBuyCard() {
    _navigationService.navigateToBuyGoldOrSilverView(
        withdrawMethod: "Card", balance: " 32", margin: ' 32');
  }

  void openBuyCrypto() {
    _navigationService.navigateToBuyGoldOrSilverView(
        balance: crytpoService.cryptoData!.balance.toString(),
        withdrawMethod: "Crypto",
        margin: crytpoService.cryptoData!.balance.toString());
  }

  void openBuyBank() {
    _navigationService.navigateToBuyGoldOrSilverView(
        withdrawMethod: "Bank",
        balance: bankService.bankData!.balance.toString(),
        margin: bankService.bankData!.balance.toString());
  }
}
