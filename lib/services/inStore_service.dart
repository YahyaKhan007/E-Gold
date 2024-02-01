import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/inStore.dart';
import 'package:e_gold/services/userProfileService.dart';

class InStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userService = locator<UserProfileService>();
  InStore? instoreData;

  getInStoreData() async {
    instoreData = await getInStoreFromWallet();
  }

  Future<InStore?> getInStoreFromWallet() async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificInStoreRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('instore')
          .doc('instoreData');
      DocumentSnapshot documentSnapshot = await specificInStoreRef.get();
      return documentSnapshot.exists
          ? InStore.fromSnapshot(documentSnapshot)
          : null;
    } catch (error) {
      print('Error getting instore from wallet: $error');
      return null;
    }
  }

  Future<bool> addInStoreToWallet(InStore instoreData) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificInStoreRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('instore')
          .doc('instoreData');
      Map<String, dynamic> instoreJson = instoreData.toJson();
      await specificInStoreRef.set(instoreJson);
      return true;
    } catch (error) {
      print('Error adding instore to wallet: $error');
      return false;
    }
  }

  Future<bool> doesInStoreCollectionExist() async {
    try {
      String uid = userService.user!.uid;
      CollectionReference instoreRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('instore');
      QuerySnapshot querySnapshot = await instoreRef.limit(1).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      print('Error checking if instore collection exists: $error');
      return false;
    }
  }

  Future<bool> addBalanceToInStoreWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificInStoreRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('instore')
          .doc('instoreData');
      InStore? existingInStoreData = await getInStoreFromWallet();
      if (existingInStoreData != null) {
        existingInStoreData.balance = existingInStoreData.balance + amount;
        existingInStoreData.margin = existingInStoreData.margin! + amount;
        await specificInStoreRef.update({
          'balance': existingInStoreData.balance,
          'margin': existingInStoreData.margin,
        });
      }
      return true;
    } catch (error) {
      print('Error adding/updating instore in wallet: $error');
      return false;
    }
  }

  Future<bool> deductBalanceFromInStoreWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificInStoreRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('instore')
          .doc('instoreData');
      InStore? existingInStoreData = await getInStoreFromWallet();
      if (existingInStoreData != null &&
          existingInStoreData.balance! >= amount) {
        existingInStoreData.balance = existingInStoreData.balance! - amount;
        await specificInStoreRef.update({
          'balance': existingInStoreData.balance,
        });
        return true;
      } else {
        print('Insufficient balance for deduction');
        return false;
      }
    } catch (error) {
      print('Error deducting from instore in wallet: $error');
      return false;
    }
  }

  Future<bool> deductMarginFromInStoreWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificInStoreRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('instore')
          .doc('instoreData');
      InStore? existingInStoreData = await getInStoreFromWallet();
      if (existingInStoreData != null &&
          existingInStoreData.margin! >= amount) {
        existingInStoreData.margin = existingInStoreData.margin! - amount;
        await specificInStoreRef.update({
          'margin': existingInStoreData.margin,
        });
        return true;
      } else {
        print('Insufficient balance for deduction');
        return false;
      }
    } catch (error) {
      print('Error deducting from instore in wallet: $error');
      return false;
    }
  }
}
