import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/transactionDetails.dart';

class TransactiondetailsViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  void onBack() {
    navigationService.back();
  }

  String formattedDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('MMMM d, y H:mm').format(dateTime);
  }

  void sellTransaction(TransactionDetails transactionDetails) async {
    try {
      if (transactionDetails.transactionType == 'Buy') {
        // TransactionDetails newTransaction = TransactionDetails(
        //   status: 'Completed',
        //   totalPaid: transactionDetails.totalPaid,
        //   totalBonus: 0,
        //   transactionType: 'Buy',
        //   totalGoldBought: transactionDetails.totalGoldBought,
        //   withdrawMethod: transactionDetails.withdrawMethod,
        //   walletType: transactionDetails.walletType,
        //   transactionDate: Timestamp.now(),
        //   transactionId: 'unique_transaction_id',
        //   buyGoldRate:
        //       currentGoldRate, // Replace with a unique ID for each transaction
        // );
      }
    } catch (e, stackTrace) {
      log("stackTrace    ----:----  $stackTrace");
    }
  }
}
