import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/services/balance_service.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddAmountForBalanceDialogModel extends BaseViewModel {
  final String data;
  AddAmountForBalanceDialogModel({required this.data});
  final TextEditingController amount = TextEditingController();
  final _balanceService = locator<BalanceService>();
  final _bankService = locator<BankService>();
  final _cryptoService = locator<CryptoService>();

  void addBalance(BuildContext context) async {
    if (data == 'bank') {
      bool check2 = await _bankService
          .addBalanceToBankWallet(double.parse(amount.text.toString()));
      bool? check = await _balanceService.addBalance(
          FirebaseAuth.instance.currentUser!.uid,
          double.parse(amount.text.toString()));
      if (check! && check2) {
        Navigator.pop(context);
      }
    } else if (data == 'crypto') {
      bool check2 = await _cryptoService
          .addBalanceToCryptoWallet(double.parse(amount.text.toString()));
      bool? check = await _balanceService.addBalance(
          FirebaseAuth.instance.currentUser!.uid,
          double.parse(amount.text.toString()));
      if (check! && check2) {
        Navigator.pop(context);
      }
    }
  }
}
