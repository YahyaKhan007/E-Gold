import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/balance.dart';
import 'package:stacked_services/stacked_services.dart';

class BalanceService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  final _snackbarService = locator<SnackbarService>();
  BalanceModel? balanceData;

  getBalanceData(String userId) async {
    balanceData = await dataGet(userId);
  }

  Future<void> updateBalance(
      String userId, double newBalance, double newMargin) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('wallet')
          .doc('balance')
          .update({'balance': newBalance, 'margin': newMargin});
    } catch (e) {
      _showErrorSnackbar(
        'Error updating balance: $e',
      );
    }
  }

  Future<void> updateBalanceForDeduct(String userId, double newBalance) async {
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

  Future<void> updateMarginForDeduct(String userId, double newBalance) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('wallet')
          .doc('balance')
          .update({'margin': newBalance});
    } catch (e) {
      _showErrorSnackbar(
        'Error updating balance: $e',
      );
    }
  }

  Future<BalanceModel?> dataGet(String userId) async {
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

  Future<void> createBalance(
      String userId, double initialBalance, double initialMargin) async {
    try {
      await _usersCollection
          .doc(userId)
          .collection('wallet')
          .doc('balance')
          .set(BalanceModel(balance: initialBalance, margin: initialMargin)
              .toJson());
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

  Future<bool?> addBalance(String userId, double amount) async {
    try {
      BalanceModel? currentBalance = await dataGet(userId);

      if (currentBalance != null) {
        double newBalance = currentBalance.balance + amount;
        double newMargin = currentBalance.margin + amount;
        await updateBalance(userId, newBalance, newMargin);
        _showSuccessSnackbar('Balance added successfully');
        return true;
      } else {
        _showErrorSnackbar('Balance document does not exist');
        return false;
      }
    } catch (e) {
      _showErrorSnackbar('Error adding balance: $e');
      return false;
    }
  }

  Future<void> deductBalance(String userId, double amount) async {
    try {
      BalanceModel? currentBalance = await dataGet(userId);

      if (currentBalance != null) {
        if (currentBalance.balance >= amount) {
          double newBalance = currentBalance.balance - amount;
          await updateBalanceForDeduct(userId, newBalance);
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

  Future<void> deductMargin(String userId, double amount) async {
    try {
      BalanceModel? currentBalance = await dataGet(userId);

      if (currentBalance != null) {
        if (currentBalance.margin >= amount) {
          double newBalance = currentBalance.margin - amount;
          await updateMarginForDeduct(userId, newBalance);
          _showSuccessSnackbar('Margin deducted successfully');
        } else {
          _showErrorSnackbar('Insufficient funds');
        }
      } else {
        _showErrorSnackbar('Balance document does not exist');
      }
    } catch (e) {
      _showErrorSnackbar('Error deducting margin: $e');
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
