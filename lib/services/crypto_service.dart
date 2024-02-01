import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/services/userProfileService.dart';

class CryptoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userService = locator<UserProfileService>();
  Crypto? cryptoData;

  getCryptoData() async {
    cryptoData = await getCryptoFromWallet();
  }

  Future<Crypto?> getCryptoFromWallet() async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificCryptoRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('crypto')
          .doc('cryptoData');
      DocumentSnapshot documentSnapshot = await specificCryptoRef.get();
      return documentSnapshot.exists
          ? Crypto.fromSnapshot(documentSnapshot)
          : null;
    } catch (error) {
      print('Error getting crypto from wallet: $error');
      return null;
    }
  }

  Future<bool> addCryptoToWallet(Crypto cryptoData) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificCryptoRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('crypto')
          .doc('cryptoData');
      // Map<String, dynamic> cryptoJson = cryptoData.toJson();
      await specificCryptoRef.set(cryptoData.toJson());
      print(cryptoData);
      return true;
    } catch (error) {
      print('Error adding crypto to wallet: $error');
      return false;
    }
  }

  Future<bool> doesCryptoCollectionExist() async {
    try {
      String uid = userService.user!.uid;
      CollectionReference cryptoRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('crypto');
      QuerySnapshot querySnapshot = await cryptoRef.limit(1).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      print('Error checking if crypto collection exists: $error');
      return false;
    }
  }

  Future<bool> addBalanceToCryptoWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificCryptoRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('crypto')
          .doc('cryptoData');
      Crypto? existingCryptoData = await getCryptoFromWallet();
      if (existingCryptoData != null) {
        existingCryptoData.balance = existingCryptoData.balance! + amount;
      }
      Map<String, dynamic> updatedCryptoJson = existingCryptoData!.toJson();
      await specificCryptoRef.set(updatedCryptoJson);
      return true;
    } catch (error) {
      print('Error adding/updating crypto in wallet: $error');
      return false;
    }
  }

  Future<bool> deductFromCryptoWallet(double amount) async {
    try {
      String uid = userService.user!.uid;
      DocumentReference specificCryptoRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('wallet')
          .doc('balance')
          .collection('crypto')
          .doc('cryptoData');
      Crypto? existingCryptoData = await getCryptoFromWallet();
      if (existingCryptoData != null && existingCryptoData.balance! >= amount) {
        existingCryptoData.balance = existingCryptoData.balance! - amount;
        Map<String, dynamic> updatedCryptoJson = existingCryptoData.toJson();
        await specificCryptoRef.set(updatedCryptoJson);
        return true;
      } else {
        print('Insufficient balance for deduction');
        return false;
      }
    } catch (error) {
      print('Error deducting from crypto in wallet: $error');
      return false;
    }
  }
}
