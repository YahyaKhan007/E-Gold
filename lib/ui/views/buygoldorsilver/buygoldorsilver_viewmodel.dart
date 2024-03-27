import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyGoldOrSilverViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final bankService = locator<BankService>();
  final _snackbarService = locator<SnackbarService>();
  final dialogService = locator<DialogService>();
  final balanceService = locator<BalanceService>();
  final cryptoService = locator<CryptoService>();
  final transactionDetailsService = locator<TransactionDetailsService>();
  final String balance;
  final String margin;
  BuyGoldOrSilverViewModel(this.balance, this.margin, this.withdrawMethod);
  String amount = '';
  double totalGramsToBuy = 0.0;
  final withdrawMethod;
  double? enteredAmount;
  double? availableBalance;
  bool gold = true;
  bool navi = true;

  void goldVal() {
    gold = true;
    rebuildUi();
  }

  void silverVal() {
    gold = false;
    rebuildUi();
  }

  void onKeyboardTap(String value) {
    amount = amount + value;
    enteredAmount = double.tryParse(amount);
    print(enteredAmount);
    rebuildUi();
  }

  void rightButtonfn() {
    if (amount.isNotEmpty) {
      amount = amount.substring(0, amount.length - 1);
      if (amount.isEmpty) {
        convertTolaToGrams(0.0, currentGoldRate);
      } else {
        convertTolaToGrams(double.parse(amount), currentGoldRate);
      }
      print(amount);
      rebuildUi();
    }
  }

  void convertTolaToGrams(double amountInTola, double goldRate) {
    if (amountInTola > 0) {
      totalGramsToBuy = amountInTola / goldRate;
    } else {
      totalGramsToBuy = 0.0;
    }
    log(totalGramsToBuy.toString());
    rebuildUi();
  }

  void rightButtonLongfn() {
    if (amount.isNotEmpty) {
      amount = '';
      totalGramsToBuy = 0.0;
      rebuildUi();
    }
  }

  void enterBalance() async {
    TransactionDetails newTransaction = TransactionDetails(
      isSold: false,
      status: 'Completed',
      totalPaid: 100.0,
      totalBonus: 20.0,
      transactionType: 'Buy',
      totalGoldBought: 5.0,
      withdrawMethod: 'In-Store',
      walletType: 'Main Street',
      transactionDate: Timestamp.now(),
      transactionId: 'unique_transaction_id',
      buyGoldRate:
          currentGoldRate, // Replace with a unique ID for each transaction
    );

    await transactionDetailsService.addTransaction(
        userId: FirebaseAuth.instance.currentUser!.uid,
        transactionDetails: newTransaction);
    // _balanceService.addBalance(FirebaseAuth.instance.currentUser!.uid, 10.0);
  }

  void toContinue() async {
    try {
      double? ammount = double.tryParse(amount);
      if (amount.isEmpty) {
        _snackbarService.showSnackbar(
          message: 'Enter Some amount',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      } else {
        TransactionDetails newTransaction = TransactionDetails(
          status: 'Completed',
          totalPaid: ammount!,
          totalBonus: 0,
          transactionType: 'Buy',
          totalGoldBought: totalGramsToBuy,
          withdrawMethod: withdrawMethod,
          walletType: withdrawMethod,
          transactionDate: Timestamp.now(),
          transactionId: 'unique_transaction_id',
          buyGoldRate: currentGoldRate,
          isSold: false, // Replace with a unique ID for each transaction
        );
        if (withdrawMethod == 'Crypto') {
          bool check = false;
          if (gold) {
            check = await cryptoService.deductBalanceFromCryptoWallet(ammount);
          } else {
            check = await cryptoService.deductMarginFromCryptoWallet(ammount);
          }

          if (check) {
            gold
                ? await balanceService.deductBalance(
                    FirebaseAuth.instance.currentUser!.uid,
                    double.parse(amount))
                : await balanceService.deductMargin(
                    FirebaseAuth.instance.currentUser!.uid,
                    double.parse(amount));
            await cryptoService.getCryptoData();
            await transactionDetailsService.addTransaction(
                userId: FirebaseAuth.instance.currentUser!.uid,
                transactionDetails: newTransaction);
            _snackbarService.showSnackbar(
              message:
                  'Congratulation you have bought gold of amount: $ammount',
              title: 'Success',
              duration: const Duration(seconds: 2),
            );
          } else {
            _snackbarService.showSnackbar(
              message: 'Not enough balance in your account',
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
            navi = false;
          }
        } else if (withdrawMethod == 'Bank') {
          bool check = false;
          if (gold) {
            check = await bankService.deductBalanceFromBankWallet(ammount);
          } else {
            check = await bankService.deductMarginFromBankWallet(ammount);
          }
          if (check) {
            gold
                ? await balanceService.deductBalance(
                    FirebaseAuth.instance.currentUser!.uid,
                    double.parse(amount))
                : await balanceService.deductMargin(
                    FirebaseAuth.instance.currentUser!.uid,
                    double.parse(amount));
            await bankService.getBankData();
            await transactionDetailsService.addTransaction(
                userId: FirebaseAuth.instance.currentUser!.uid,
                transactionDetails: newTransaction);
            _snackbarService.showSnackbar(
              message:
                  'Congratulation you have bought gold of amount: $ammount',
              title: 'Success',
              duration: const Duration(seconds: 2),
            );
          } else {
            _snackbarService.showSnackbar(
              message: 'Not enough balance in your account',
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
            navi = false;
          }
        } else {}
        await balanceService
            .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
        await transactionDetailsService
            .getAllTransactionDetails(FirebaseAuth.instance.currentUser!.uid);
        navi
            ? navigationService.replaceWithDashboardScreenView()
            : navigationService.replaceWithDepositScreenView();
      }
    } catch (e) {}
  }

  void onBack() {
    navigationService.back();
  }
}
