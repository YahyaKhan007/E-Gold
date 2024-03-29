import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class TransactionDetailsService {
  List<TransactionDetails>? transactionDetails;
  final userService = locator<UserProfileService>();

  getAllTransactionDetails(String userID) async {
    transactionDetails = await getAllTransactions(userID);
  }

  final CollectionReference _transactionDetailsCollection =
      FirebaseFirestore.instance.collection(
          'users'); // Adjust the collection name as per your Firebase structure

  // Future<void> createTransaction({
  //   required String userId,
  //   transactionDetails,
  // }) async {
  //   try {
  //     await _transactionDetailsCollection
  //         .doc(userId)
  //         .collection('transactions')
  //         .doc(transactionDetails['transactionId'])
  //         .set(transactionDetails);
  //   } catch (e) {
  //     print('Error creating transaction: $e');
  //   }
  // }

  Future<List<TransactionDetails>> getTransactionsByPaymentMethod(
    String userId,
    String paymentMethod,
  ) async {
    try {
      log("Fetching  Transactions 1");

      final querySnapshot = await _transactionDetailsCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('transactions')
          .where('withdrawMethod', isEqualTo: paymentMethod)
          .get();

      log("Fetching  Transactions 2");

      return querySnapshot.docs
          .map((doc) => TransactionDetails.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error retrieving transactions: $e');
      return [];
    }
  }

  Future<List<TransactionDetails>> getAllTransactions(
    String userId,
  ) async {
    try {
      final querySnapshot = await _transactionDetailsCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('transactions')
          .get();

      return querySnapshot.docs
          .map((doc) => TransactionDetails.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error retrieving transactions: $e');
      return [];
    }
  }

  Future<void> updateTransaction({
    required String userId,
    required String transactionId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      await _transactionDetailsCollection
          .doc(userId)
          .collection('transactions')
          .doc(transactionId)
          .update(updatedData);
    } catch (e) {
      print('Error updating transaction: $e');
    }
  }

  Future<void> deleteTransaction({
    required String userId,
    required String transactionId,
  }) async {
    try {
      await _transactionDetailsCollection
          .doc(userId)
          .collection('transactions')
          .doc(transactionId)
          .delete();
    } catch (e) {
      print('Error deleting transaction: $e');
    }
  }

  Future<void> addTransaction({
    required String userId,
    required TransactionDetails newTransactionDetails,
    TransactionDetails? oldTransactionDetails,
  }) async {
    try {
      // Add a new document to the collection with an auto-generated ID
      final newDocRef = await _transactionDetailsCollection
          .doc(userId)
          .collection('transactions')
          .add(newTransactionDetails.toMap());

// * ------------------------------------------

// ! Checking if Old Transaction is not null

// * ------------------------------------------

      if (oldTransactionDetails != null) {
        print('Old Transaction is not null');
        await _transactionDetailsCollection
            .doc(userId)
            .collection('transactions')
            .doc(oldTransactionDetails.transactionId)
            .update({'soldTransactionId': newDocRef.id});
      }

      // Get the newly generated document ID
      final newDocId = newDocRef.id;

      // Update the 'transactionId' field of the newly created document with the same value as the document ID
      await newDocRef.update({'transactionId': newDocId});
    } catch (e) {
      print('Error adding transaction: $e');
    }
  }
}
