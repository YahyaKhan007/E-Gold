import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/transactionDetails.dart';
import '../../../services/balance_service.dart';
import '../../../services/crypto_service.dart';
import '../../../services/transaction_service.dart';
import '../../common/app_strings.dart';

class TransactiondetailsViewModel extends BaseViewModel {
  final cryptoService = locator<CryptoService>();
  final balanceService = locator<BalanceService>();
  final transactionDetailsService = locator<TransactionDetailsService>();
  final _snackbarService = locator<SnackbarService>();
  bool navi = true;

  bool gold = true;

  final navigationService = locator<NavigationService>();
  void onBack() {
    navigationService.back();
  }

  String formattedDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('MMMM d, y H:mm').format(dateTime);
  }

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

  void sellTransaction(TransactionDetails transactionDetails) async {
    try {
      if (transactionDetails.transactionType == 'Buy') {
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('transactions')
            .doc(transactionDetails.transactionId)
            .update({'isSold': true});
        log("came to Loss 1 --->  ");
        double profitLoss = calculateProfitLoss(
            gramsBought: transactionDetails.totalGoldBought,
            buyRate: transactionDetails.buyGoldRate,
            conversionRate: conversionFactor,
            sellRate: currentGoldRate);
        TransactionDetails newTransaction = TransactionDetails(
          status: 'Completed',
          // totalPaid: transactionDetails.totalPaid,
          totalPaid: transactionDetails.totalPaid + profitLoss,
          totalBonus: profitLoss,
          transactionType: 'Sell',
          totalGoldBought: transactionDetails.totalGoldBought,
          withdrawMethod: transactionDetails.withdrawMethod,
          walletType: transactionDetails.walletType,
          transactionDate: Timestamp.now(),
          transactionId: 'unique_transaction_id',
          buyGoldRate: currentGoldRate,
          isSold: true, // Replace with a unique ID for each transaction
        );

        log("came to Loss 2 --->  ");
        log(transactionDetails.walletType);
        switch (transactionDetails.walletType) {
          case 'Crypto':
            log("came to Loss 3 --->  Crypto");

            bool check = false;
            if (gold) {
              check = await cryptoService.addBalanceFromCryptoWallet(
                  transactionDetails.totalPaid + profitLoss);
            } else {
              check = await cryptoService
                  .deductMarginFromCryptoWallet(transactionDetails.totalPaid);
            }

            if (check) {
              gold
                  ? await balanceService.addBalanceToWallet(
                      FirebaseAuth.instance.currentUser!.uid,
                      transactionDetails.totalPaid)
                  : await balanceService.addMarginToWallet(
                      FirebaseAuth.instance.currentUser!.uid,
                      transactionDetails.totalPaid);
              await cryptoService.getCryptoData();
              await transactionDetailsService.addTransaction(
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  transactionDetails: newTransaction);
              _snackbarService.showSnackbar(
                message:
                    'Congratulation you have Sold gold of amount: ${transactionDetails.totalPaid + profitLoss}',
                title: 'Success',
                duration: const Duration(seconds: 2),
              );
            } else {
              _snackbarService.showSnackbar(
                message: 'There is some Issue',
                title: 'Error',
                duration: const Duration(seconds: 2),
              );
              navi = false;
            }
            return;
          case 'Bank':
            return;
          case 'InStore':
            return;
          // case 'Crypto':
          // return;
          default:
            log("Default has been run");
            navi
                ? navigationService.replaceWithDashboardScreenView()
                : navigationService.replaceWithDepositScreenView();
            return;
        }
      }
    } catch (e, stackTrace) {
      log("stackTrace    ----:----  $stackTrace");
    }
  }
}
