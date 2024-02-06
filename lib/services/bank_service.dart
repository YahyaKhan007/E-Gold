import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/bank.dart';
import 'package:e_gold/services/userProfileService.dart';

class BankService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userService = locator<UserProfileService>();
  Bank? bankData;

  getBankData() async {
    bankData = await getBankFromWallet();
  }

  Future<bool> addBankToWallet(Bank bankData) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference userRef = _firestore.collection('users').doc(uid);
      DocumentReference specificBankRef = userRef
          .collection('wallet')
          .doc('balance')
          .collection('bank')
          .doc('bankData');
      Map<String, dynamic> bankJson = bankData.toJson();
      await specificBankRef.set(bankJson);
      return true;
    } catch (error) {
      print('Error adding bank to wallet: $error');
      return false;
    }
  }

  Future<Bank?> getBankFromWallet() async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificBankRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('bank')
          .doc('bankData');
      DocumentSnapshot documentSnapshot = await specificBankRef.get();
      return documentSnapshot.exists
          ? Bank.fromSnapshot(documentSnapshot)
          : null;
    } catch (error) {
      print('Error getting bank from wallet: $error');
      return null;
    }
  }

  // Future<bool> doesBankCollectionExist() async {
  //   try {
  //     String uid = userService.user!.uid;
  //     CollectionReference bankRef = _firestore
  //         .collection('users')
  //         .doc(uid)
  //         .collection('wallet')
  //         .doc('balance')
  //         .collection('bank');
  //     QuerySnapshot querySnapshot = await bankRef.limit(1).get();
  //     return querySnapshot.docs.isNotEmpty;
  //   } catch (error) {
  //     print('Error checking if bank collection exists: $error');
  //     return false;
  //   }
  // }
  //

  Future<bool> doesBankCollectionExist() async {
    try {
      String uid = userService.user!.uid;
      CollectionReference bankRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('bank');
      QuerySnapshot querySnapshot = await bankRef.limit(1).get();
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> data =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        return data.containsKey('accountNumber') &&
            data['accountNumber'] != null &&
            data['accountNumber'] != '';
      } else {
        return false;
      }
    } catch (error) {
      print('Error checking if bank collection exists: $error');
      return false;
    }
  }

  Future<bool> addBalanceToBankWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificBankRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('bank')
          .doc('bankData');
      Bank? existingBankData = await getBankFromWallet();
      if (existingBankData != null) {
        existingBankData.balance = existingBankData.balance! + amount;
        existingBankData.margin = existingBankData.margin! + amount;
        await specificBankRef.update({
          'balance': existingBankData.balance,
          'margin': existingBankData.margin,
        });
      }
      return true;
    } catch (error) {
      print('Error adding/updating bank in wallet: $error');
      return false;
    }
  }

  Future<bool> deductBalanceFromBankWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificBankRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('bank')
          .doc('bankData');
      Bank? existingBankData = await getBankFromWallet();
      if (existingBankData != null && existingBankData.balance! >= amount) {
        existingBankData.balance = existingBankData.balance! - amount;
        await specificBankRef.update({
          'balance': existingBankData.balance,
        });
        return true;
      } else {
        print('Insufficient balance for deduction');
        return false;
      }
    } catch (error) {
      print('Error deducting from bank in wallet: $error');
      return false;
    }
  }

  Future<bool> deductMarginFromBankWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificBankRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('bank')
          .doc('bankData');
      Bank? existingBankData = await getBankFromWallet();
      if (existingBankData != null && existingBankData.margin! >= amount) {
        existingBankData.margin = existingBankData.margin! - amount;
        await specificBankRef.update({
          'margin': existingBankData.margin,
        });
        return true;
      } else {
        print('Insufficient balance for deduction');
        return false;
      }
    } catch (error) {
      print('Error deducting from bank in wallet: $error');
      return false;
    }
  }
}
