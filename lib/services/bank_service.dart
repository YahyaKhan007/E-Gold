import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/bank.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BankService {
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Bank? bankData;
  getBankData() async {
    bankData = await getBankFromWallet();
  }

  // Function to add a Bank to the 'bank' subcollection within 'wallet' for a specific user
  Future<bool> addBankToWallet(Bank bankData) async {
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'bank' subcollection within the 'wallet' subcollection
      CollectionReference bankRef = walletRef.doc('balance').collection('bank');

      // Use a specific document ID for the bank document (e.g., 'bankData')
      DocumentReference specificBankRef = bankRef.doc('bankData');

      // Convert the Bank instance to JSON data
      Map<String, dynamic> bankJson = bankData.toJson();

      // Set (add/update) the bank data in the 'bank' subcollection
      await specificBankRef.set(bankJson);

      // Return true if the operation is successful
      return true;
    } catch (error) {
      print('Error adding bank to wallet: $error');
      // Return false if there is an error
      return false;
    }
  }

  // Function to get the Bank from the 'bank' subcollection within 'wallet' for a specific user
  Future<Bank?> getBankFromWallet() async {
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'bank' subcollection within the 'wallet' subcollection
      CollectionReference bankRef = walletRef.doc('balance').collection('bank');

      // Use the specific document ID for the bank document (e.g., 'bankData')
      DocumentReference specificBankRef = bankRef.doc('bankData');

      // Get the document from the 'bank' subcollection
      DocumentSnapshot documentSnapshot = await specificBankRef.get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document to a Bank instance
        return Bank.fromSnapshot(documentSnapshot);
      } else {
        // Return null if the document doesn't exist
        return null;
      }
    } catch (error) {
      print('Error getting bank from wallet: $error');
      // Handle error as needed
      return null;
    }
  }

  // Function to check if the 'bank' subcollection exists within 'wallet' for a specific user
  Future<bool> doesBankCollectionExist() async {
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'bank' subcollection within the 'wallet' subcollection
      CollectionReference bankRef = walletRef.doc('balance').collection('bank');

      // Get the documents from the 'bank' subcollection (limit 1)
      QuerySnapshot querySnapshot = await bankRef.limit(1).get();

      // Check if there is at least one document in the 'bank' subcollection
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      print('Error checking if bank collection exists: $error');
      // Handle error as needed
      return false;
    }
  }
}
