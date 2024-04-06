import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/bank_service.dart';
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
  final bankService = locator<BankService>();
  final balanceService = locator<BalanceService>();
  final transactionDetailsService = locator<TransactionDetailsService>();
  final _snackbarService = locator<SnackbarService>();
  final _bankService = locator<BankService>();

  bool navi = true;

  bool gold = true;

  final navigationService = locator<NavigationService>();
  void onBack() {
    navigationService.back();
  }

  void toSpeceficSellTransaction(TransactionDetails sellTransactionDetails,
      String paidForGoldwhileBuying) {
    navigationService.navigateToSpeceficSellTransactionView(
        paidForGoldwhileBuying: paidForGoldwhileBuying,
        sellTransactionDetails: sellTransactionDetails,
        key: null);
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

  // * Fetching a specefic Transaction
  Future<TransactionDetails?> getDocumentById(String documentId) async {
    try {
      // Construct the document reference
      DocumentReference<Map<String, dynamic>> docRef = FirebaseFirestore
          .instance
          .collection('users')
          .doc(FirebaseAuth
              .instance.currentUser!.uid) // Replace with your user ID logic
          .collection('transactions')
          .doc(documentId);

      // Fetch the document
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await docRef.get();

      // Return the document snapshot
      var sellTransactionDetail =
          TransactionDetails.fromMap(documentSnapshot.data()!);
      return sellTransactionDetail;
    } catch (e, stackTrace) {
      // Handle any errors (e.g., document not found)
      log('StackTrace : ${stackTrace.toString()}');
      log('Error fetching document: $e');
      return null; // You can return an appropriate value or throw an exception here
    }
  }

  void sellTransaction(TransactionDetails transactionDetails) async {
    try {
      if (transactionDetails.transactionType == 'Buy') {
        // ^   ---------------------
        // ^   ---------------------
        // ^   ---------------------

        //  ~  Update Current Transaction to   ----- S O L D -----

        // ^   ---------------------
        // ^   ---------------------
        // ^   ---------------------

        double profitLoss = calculateProfitLoss(
            gramsBought: transactionDetails.totalGoldBought,
            buyRate: transactionDetails.buyGoldRate,
            conversionRate: conversionFactor,
            sellRate: currentGoldRate);

        log("Profit Loss: $profitLoss");

        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('transactions')
            .doc(transactionDetails.transactionId)
            .update({
          'isSold': true,
          'totalBonus': profitLoss,
        });

        // ^   ------------------------------------------
        // ^   ------------------------------------------
        // ^   ------------------------------------------

        log(" Total paid :  ${transactionDetails.totalPaid}  &   profitLoss  :  $profitLoss   ======>    ==  ${(transactionDetails.totalPaid + profitLoss).toString()}");

        TransactionDetails newTransaction = TransactionDetails(
          isMargin: transactionDetails.isMargin,
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
          isSold: true,
          soldTransactionId:
              '', // Replace with a unique ID for each transaction
        );
        rebuildUi();

        log(transactionDetails.walletType);
        switch (transactionDetails.walletType) {
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------

          // !       C A S E       C R Y P T O

          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------

          case 'Crypto':
            log("\n\n\t\tCase : Crypto\n\n");

            bool check = false;
            if (transactionDetails.isMargin == false) {
              log("\n\t========\tCame to Balance section\n\t========");
              check = await cryptoService.addBalanceFromCryptoWallet(
                  transactionDetails.totalPaid + profitLoss,
                  transactionDetails,
                  false);

              await balanceService.addBalanceToWallet(
                  FirebaseAuth.instance.currentUser!.uid,
                  transactionDetails.totalPaid + profitLoss);
            } else {
              // ^ remains For Margin
              log("\n\t========\tCame to Margin Section\n\t========");

              balanceService.addBalance(
                  FirebaseAuth.instance.currentUser!.uid, profitLoss, true);

              check = await cryptoService.addBalanceFromCryptoWallet(
                  profitLoss, transactionDetails, false);

              // await balanceService.addMarginToWallet(
              //     FirebaseAuth.instance.currentUser!.uid,
              //     transactionDetails.totalPaid,
              //     true);
            }

            if (check) {
              // gold
              //     ? await balanceService.addBalanceToWallet(
              //         FirebaseAuth.instance.currentUser!.uid,
              //         transactionDetails.totalPaid + profitLoss)
              //     : await balanceService.addMarginToWallet(
              //         FirebaseAuth.instance.currentUser!.uid,
              //         transactionDetails.totalPaid);
              await cryptoService.getCryptoData();
              await transactionDetailsService.addTransaction(
                  oldTransactionDetails: transactionDetails,
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  newTransactionDetails: newTransaction);
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
              navi = true;
            }
            navigationService.replaceWithDashboardScreenView();
            break;

          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------

          // !       C A S E      B A N K     ||     I N S T O R E

          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          case 'Bank' || 'InStore':
            log("came to Loss 3 --->  Bank || Instore");

            bool check = false;
            if (gold) {
              check = await bankService.addBalanceToBankWallet(
                transactionDetails.totalPaid + profitLoss,
                false,
              );
            } else {
              // ^ remains For Bank Margin

              check = await cryptoService
                  .deductMarginFromCryptoWallet(transactionDetails.totalPaid);
            }

            if (check) {
              gold
                  ? await balanceService.addBalanceToWallet(
                      FirebaseAuth.instance.currentUser!.uid,
                      transactionDetails.totalPaid + profitLoss)
                  :
                  // ^ Remains for Bank Margin

                  await balanceService.addMarginToWallet(
                      FirebaseAuth.instance.currentUser!.uid,
                      transactionDetails.totalPaid,
                      true);

              // await _bankService.addBalanceToBankWallet(
              //     double.parse(
              //         (transactionDetails.totalPaid + profitLoss).toString()),
              //     false);

              await cryptoService.getCryptoData();
              await transactionDetailsService.addTransaction(
                  oldTransactionDetails: transactionDetails,
                  userId: FirebaseAuth.instance.currentUser!.uid,
                  newTransactionDetails: newTransaction);
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
              navi = true;
            }
            navigationService.replaceWithDashboardScreenView();

            break;

          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------

          // !       C A S E       I N S T O R E

          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          // *   -----------------------------------------
          case 'InStore':
            return;
          // case 'Crypto':
          // return;
          default:
            log("Default has been run");
            navi
                ? navigationService.replaceWithDashboardScreenView()
                : navigationService.replaceWithDepositScreenView();
            break;
        }
      }
    } catch (e, stackTrace) {
      log("stackTrace    ----:----  $stackTrace");
    }
  }
}
