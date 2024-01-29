import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDetailsService {
  final CollectionReference _transactionDetailsCollection =
      FirebaseFirestore.instance.collection(
          'users'); // Adjust the collection name as per your Firebase structure

  Future<void> createTransaction({
    required String userId,
    required Map<String, dynamic> transactionDetails,
  }) async {
    try {
      await _transactionDetailsCollection
          .doc(userId)
          .collection('transactionDetails')
          .doc(transactionDetails['transactionId'])
          .set(transactionDetails);
    } catch (e) {
      print('Error creating transaction: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getTransactionsByPaymentMethod(
      String userId, String paymentMethod) async {
    try {
      final querySnapshot = await _transactionDetailsCollection
          .doc(userId)
          .collection('transactionDetails')
          .where('withdrawMethod', isEqualTo: paymentMethod)
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
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
          .collection('transactionDetails')
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
          .collection('transactionDetails')
          .doc(transactionId)
          .delete();
    } catch (e) {
      print('Error deleting transaction: $e');
    }
  }
}
