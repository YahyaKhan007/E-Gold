import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/balance.dart';
import 'package:stacked_services/stacked_services.dart';

class BalanceService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final _snackbarService = locator<SnackbarService>();
  Future<void> updateBalance(String userId, double newBalance) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('wallet')
          .doc('balance')
          .update({'balance': newBalance});
    } catch (e) {
      _showErrorSnackbar(
        'Error updating balance: $e',
      );
    }
  }

  Future<BalanceModel?> getBalance(String userId) async {
    try {
      DocumentSnapshot snapshot = await _usersCollection
          .doc(userId)
          .collection('wallet')
          .doc('balance')
          .get();

      if (snapshot.exists) {
        return BalanceModel.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      _showErrorSnackbar('Error getting balance: $e');
      return null;
    }
  }

  Future<void> createBalance(String userId, double initialBalance) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('wallet')
          .doc('balance')
          .set(BalanceModel(balance: initialBalance).toJson());
    } catch (e) {
      _showErrorSnackbar('Error creating balance: $e');
    }
  }

  Future<void> deleteBalance(String userId) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('wallet')
          .doc('balance')
          .delete();
      _showSuccessSnackbar('Balance deleted successfully');
    } catch (e) {
      _showErrorSnackbar(
        'Error deleting balance: $e',
      );
    }
  }

  Future<void> addBalance(String userId, double amount) async {
    try {
      BalanceModel? currentBalance = await getBalance(userId);

      if (currentBalance != null) {
        double newBalance = currentBalance.balance + amount;
        await updateBalance(userId, newBalance);
        _showSuccessSnackbar('Balance added successfully');
      } else {
        _showErrorSnackbar('Balance document does not exist');
      }
    } catch (e) {
      _showErrorSnackbar('Error adding balance: $e');
    }
  }

  Future<void> deductBalance(String userId, double amount) async {
    try {
      BalanceModel? currentBalance = await getBalance(userId);

      if (currentBalance != null) {
        if (currentBalance.balance >= amount) {
          double newBalance = currentBalance.balance - amount;
          await updateBalance(userId, newBalance);
          _showSuccessSnackbar('Balance deducted successfully');
        } else {
          _showErrorSnackbar('Insufficient funds');
        }
      } else {
        _showErrorSnackbar('Balance document does not exist');
      }
    } catch (e) {
      _showErrorSnackbar('Error deducting balance: $e');
    }
  }

  void _showErrorSnackbar(String message) {
    _showSnackbar(message, 'Error');
  }

  void _showSuccessSnackbar(String message) {
    _showSnackbar(message, 'Success');
  }

  void _showSnackbar(String message, String title) {
    _snackbarService.showSnackbar(
      message: message,
      title: title,
      duration: const Duration(seconds: 2),
    );
  }
}
