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
      return querySnapshot.docs.isNotEmpty;
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
      }
      Map<String, dynamic> updatedBankJson = existingBankData!.toJson();
      await specificBankRef.set(updatedBankJson);
      return true;
    } catch (error) {
      print('Error adding/updating bank in wallet: $error');
      return false;
    }
  }

  Future<bool> deductFromBankWallet(double amount) async {
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
        Map<String, dynamic> updatedBankJson = existingBankData.toJson();
        await specificBankRef.set(updatedBankJson);
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
