import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
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

class DepositScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _balanceService = locator<BalanceService>();
  final stripeApi = locator<StripeApi>();
  Map<String, dynamic>? paymentIntent;
  final transactionDetailsService = locator<TransactionDetailsService>();


  final _cryptoService = locator<CryptoService>();
  final _bankService = locator<BankService>();
  final _snackbarService = locator<SnackbarService>();

  void goBack() {
    _navigationService.back();
  }

  void toInStorePayment() {
    _navigationService.navigateToInStorePaymentScreenView();
  }

  Future<void> createPaymentIntent() async {
    try {
      // Convert the amount to cents

      paymentIntent = await stripeApi.createPaymentIntent(
        amount: '100',
        currency: 'EUR',
      );

      print('Payment Intent: $paymentIntent');
    } catch (e) {
      print('Error creating payment intent: $e');
      // Handle error
    }
  }

  Future<void> processPayment() async {
    if (paymentIntent == null) {
      print('Payment intent is null. Call createPaymentIntent first.');
      return;
    }

    try {
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              merchantDisplayName: 'Fine Found',
            ),
          )
          .then((value) => {});

      await Stripe.instance
          .presentPaymentSheet()
          .then((value) => print("Payment success"));
    } catch (e) {
      print('Error during payment: $e');
      // Handle payment failure
    }
  }

  void toCryptoPayment() async {
    bool check = await _cryptoService.doesCryptoCollectionExist();
    if (check) {
      await _cryptoService.getCryptoData();
      _navigationService.navigateToCryptoPaymentScreenView();
    } else {
      _navigationService.navigateToCryptoPaymentScreenView();
    }
  }

  void toCardPayment() {
    _navigationService.navigateToAddNewCardPaymentScreenView();
  }

  void linkBankAccount() async {
    bool check = await _bankService.doesBankCollectionExist();
    if (check) {
      await _bankService.getBankData();
      _navigationService.navigateToLinkBankAccountScreenView();
    } else {
      _navigationService.navigateToLinkBankAccountScreenView();
    }
  }


  void enterBalance() async {
    TransactionDetails newTransaction = TransactionDetails(
      status: 'Completed',
      totalPaid: 100.0,
      totalBonus: 20.0,
      transactionType: 'Buy',
      totalGoldBought: 5.0,
      withdrawMethod: 'In-Store',
      walletType: 'Main Street',
      transactionDate: Timestamp.now(),
      transactionId:
          'unique_transaction_id', // Replace with a unique ID for each transaction
    );

    await transactionDetailsService.addTransaction(
        userId: FirebaseAuth.instance.currentUser!.uid,
        transactionDetails: newTransaction);
    // _balanceService.addBalance(FirebaseAuth.instance.currentUser!.uid, 10.0);
}}
