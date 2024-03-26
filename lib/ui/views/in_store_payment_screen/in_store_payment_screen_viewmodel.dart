import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/inStore.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/inStore_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InStorePaymentScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final TextEditingController uid = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final userService = locator<UserProfileService>();
  final formKey = GlobalKey<FormState>();
  final _instoreService = locator<InStoreService>();
  final _transactionService = locator<TransactionDetailsService>();
  final _snackbarService = locator<SnackbarService>();
  String? userID;

  void onViewModelReady() {
    setBusy(true);
    userID = userService.user!.uid;
    uid.text = userService.user!.uid;
    setBusy(false);
  }

  String? customValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Return null when validation passes
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void goBack() {
    _navigationService.back();
  }

  void toContinue(BuildContext context) async {
    if (validateForm()) {
      InStore instoreData =
          InStore(uid: userID!, balance: double.parse(amount.text.toString()));

      try {
        bool success = await _instoreService.addInStoreToWallet(instoreData);
        if (success) {
          _snackbarService.showSnackbar(
            message: 'Transaction in process',
            title: 'Success',
            duration: const Duration(seconds: 2),
          );
        } else {
          _snackbarService.showSnackbar(
            message: 'There were problems processing Transaction',
            title: 'Error',
            duration: const Duration(seconds: 2),
          );
        }

        TransactionDetails transactionDetails = TransactionDetails(
          status: 'Pending',
          totalPaid: double.parse(amount.text.toString()),
          totalBonus: double.parse(amount.text.toString()),
          totalGoldBought: 0.0,
          withdrawMethod: '',
          walletType: 'In-Store',
          transactionType: 'TopUp',
          transactionDate: Timestamp.now(),
          transactionId: 'transactionId',
          buyGoldRate: currentGoldRate,
        );
        await _transactionService.addTransaction(
            userId: FirebaseAuth.instance.currentUser!.uid,
            transactionDetails: transactionDetails);
      } catch (e) {
        _snackbarService.showSnackbar(
          message: 'Error $e',
          title: 'Error',
          duration: const Duration(seconds: 2),
        );
      }
      await _transactionService
          .getAllTransactionDetails(FirebaseAuth.instance.currentUser!.uid);
      _navigationService.replaceWithDashboardScreenView();
    }
  }
}
