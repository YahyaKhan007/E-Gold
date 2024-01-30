import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class TransactionDetailsService {
  final CollectionReference _transactionDetailsCollection =
      FirebaseFirestore.instance.collection(
          'users'); // Adjust the collection name as per your Firebase structure

  Future<void> createTransaction({
    required String userId,
    transactionDetails,
  }) async {
    try {
      await _transactionDetailsCollection
          .doc(userId)
          .collection('transactions')
          .doc(transactionDetails['transactionId'])
          .set(transactionDetails);
    } catch (e) {
      print('Error creating transaction: $e');
    }
  }

  Future<List<TransactionDetails>> getTransactionsByPaymentMethod(
    String userId,
    String paymentMethod,
  ) async {
    try {
      final querySnapshot = await _transactionDetailsCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('transactions')
          .where('withdrawMethod', isEqualTo: paymentMethod)
          .get();

      return querySnapshot.docs
          .map((doc) =>
              TransactionDetails.fromMap(doc.data() as Map<String, dynamic>))
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
    required TransactionDetails transactionDetails,
  }) async {
    try {
      await _transactionDetailsCollection
          .doc(userId)
          .collection('transactions')
          .doc()
          .set(transactionDetails.toMap());
    } catch (e) {
      print('Error adding transaction: $e');
    }
  }
}
