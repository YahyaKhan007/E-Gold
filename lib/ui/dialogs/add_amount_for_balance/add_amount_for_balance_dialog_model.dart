import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddAmountForBalanceDialogModel extends BaseViewModel {
  final String data;
  AddAmountForBalanceDialogModel({required this.data});
  final TextEditingController amount = TextEditingController();
  final _balanceService = locator<BalanceService>();
  final _bankService = locator<BankService>();
  final _cryptoService = locator<CryptoService>();
  final _transactionService = locator<TransactionDetailsService>();
  final formKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  String? customValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null when validation passes
  }

  void cancel(BuildContext context) {
    Navigator.pop(context);
  }

  void addBalance(BuildContext context) async {
    if (validateForm()) {
      if (data == 'Bank') {
        bool check2 = await _bankService
            .addBalanceToBankWallet(double.parse(amount.text.toString()));
        bool? check = await _balanceService.addBalance(
            FirebaseAuth.instance.currentUser!.uid,
            double.parse(amount.text.toString()));
        if (check! && check2) {
          TransactionDetails transactionDetails = TransactionDetails(
            status: 'Completed',
            totalPaid: double.parse(amount.text.toString()),
            totalBonus: double.parse(amount.text.toString()),
            totalGoldBought: 0.0,
            withdrawMethod: '',
            walletType: data,
            transactionType: 'TopUp',
            transactionDate: Timestamp.now(),
            transactionId: 'transactionId',
            buyGoldRate: currentGoldRate,
          );
          await _transactionService.addTransaction(
              userId: FirebaseAuth.instance.currentUser!.uid,
              transactionDetails: transactionDetails);
          Navigator.pop(context);
        }
      } else if (data == 'Crypto') {
        bool check2 = await _cryptoService
            .addBalanceToCryptoWallet(double.parse(amount.text.toString()));
        bool? check = await _balanceService.addBalance(
            FirebaseAuth.instance.currentUser!.uid,
            double.parse(amount.text.toString()));
        if (check! && check2) {
          TransactionDetails transactionDetails = TransactionDetails(
            status: 'Completed',
            totalPaid: double.parse(amount.text.toString()),
            totalBonus: double.parse(amount.text.toString()),
            totalGoldBought: 0.0,
            withdrawMethod: '',
            walletType: data,
            transactionType: 'TopUp',
            transactionDate: Timestamp.now(),
            transactionId: 'transactionId',
            buyGoldRate: currentGoldRate,
          );
          await _transactionService.addTransaction(
              userId: FirebaseAuth.instance.currentUser!.uid,
              transactionDetails: transactionDetails);
          Navigator.pop(context);
        }
      }
      await _bankService.getBankData();
      await _cryptoService.getCryptoData();
      await _balanceService
          .getBalanceData(FirebaseAuth.instance.currentUser!.uid);
      await _transactionService
          .getAllTransactionDetails(FirebaseAuth.instance.currentUser!.uid);
      _navigationService.replaceWithDashboardScreenView();
    }
  }
}
