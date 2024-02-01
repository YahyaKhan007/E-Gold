import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyGoldOrSilverViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final bankService = locator<BankService>();
  final _snackbarService = locator<SnackbarService>();
  final dialogService = locator<DialogService>();

  final cryptoService = locator<CryptoService>();
  final transactionDetailsService = locator<TransactionDetailsService>();
  final String balance;
  final String margin;
  BuyGoldOrSilverViewModel(this.balance, this.margin, this.withdrawMethod);
  String amount = '';
  final withdrawMethod;
  double? enteredAmount;
  double? availableBalance;
  bool gold = true;

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
      print(amount);
      rebuildUi();
    }
  }

  void rightButtonLongfn() {
    if (amount.isNotEmpty) {
      amount = '';
      rebuildUi();
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
          totalPaid: 0,
          totalBonus: 0,
          transactionType: 'Buy',
          totalGoldBought: ammount!,
          withdrawMethod: withdrawMethod,
          walletType: withdrawMethod,
          transactionDate: Timestamp.now(),
          transactionId:
              'unique_transaction_id', // Replace with a unique ID for each transaction
        );
        if (withdrawMethod == 'Crypto') {
          bool check = await cryptoService.deductFromCryptoWallet(ammount);
          if (check) {
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
            navigationService.replaceWithDashboardScreenView();
          } else {
            _snackbarService.showSnackbar(
              message: 'Not enough balance in your account',
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
            navigationService.replaceWithDepositScreenView();
          }
        } else if (withdrawMethod == 'Bank') {
          bool check = await bankService.deductFromBankWallet(ammount);
          if (check) {
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
            navigationService.replaceWithDashboardScreenView();
          } else {
            _snackbarService.showSnackbar(
              message: 'Not enough balance in your account',
              title: 'Error',
              duration: const Duration(seconds: 2),
            );
            navigationService.replaceWithDepositScreenView();
          }
        } else {}
        await transactionDetailsService
            .getAllTransactionDetails(FirebaseAuth.instance.currentUser!.uid);
      }
    } catch (e) {}
  }

  void onBack() {
    navigationService.back();
  }
}
