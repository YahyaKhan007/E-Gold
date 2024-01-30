import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
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

  final bankService = locator<BankService>();
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

  void toCryptoPayment() {
    _navigationService.navigateToCryptoPaymentScreenView();
  }

  void toCardPayment() {
    _navigationService.navigateToAddNewCardPaymentScreenView();
  }

  void linkBankAccount() async {
    await bankService.addToBalance(300);
    try {
      bool addSuccessful = await bankService.addToBalance(300);
      if (addSuccessful) {
        _snackbarService.showSnackbar(
          message: 'Amount added to balance Successfully',
          title: 'Success',
          duration: const Duration(seconds: 2),
        );
      } else {
        _snackbarService.showSnackbar(
          message: 'Amount was not added to balance',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
        message: 'Error $e',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
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
  }
}
