import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/bank.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BankService {
  User? user = FirebaseAuth.instance.currentUser;

  Future<bool> checkBalance(double amount) async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the document in the 'users' collection
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(uid);

      // Get the current balance
      double currentBalance = await getBalance(userDocRef);

      // Check if there is sufficient balance
      return amount > currentBalance;
    } catch (e) {
      print('Error checking balance: $e');
      return false; // Error occurred
    }
  }

  Future<double> getBalance(DocumentReference userDocRef) async {
    try {
      // Get the document snapshot
      DocumentSnapshot userDocSnapshot = await userDocRef.get();

      // Check if the document exists
      if (userDocSnapshot.exists) {
        // Retrieve the balance from the user's document
        return userDocSnapshot['balance'] ?? 0.0;
      } else {
        print('User document not found.');
        // Handle the case where the user document does not exist.
        return 0.0;
      }
    } catch (e) {
      print('Error getting balance: $e');
      // Handle errors if needed.
      return 0.0;
    }
  }

  Future<bool> deductAmount(double amount) async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the document in the 'users' collection
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(uid);

      // Get the current balance
      double currentBalance = await getBalance(userDocRef);

      // Check if there is sufficient balance
      if (amount <= currentBalance) {
        // Deduct the amount from the balance
        double newBalance = currentBalance - amount;

        // Update the balance in the user's document
        await userDocRef.update({'balance': newBalance});

        return true; // Deduction successful
      } else {
        print('Insufficient balance.');
        return false; // Insufficient balance
      }
    } catch (e) {
      print('Error deducting amount: $e');
      return false; // Error occurred
    }
  }

  Future<bool> addToBalance(double amount) async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the document in the 'users' collection
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('users').doc(uid);

      // Get the current balance
      double currentBalance = await getBalance(userDocRef);

      // Increase the balance by the specified amount
      double newBalance = currentBalance + amount;

      // Update the balance in the user's document
      await userDocRef.update({'balance': newBalance});

      return true; // Operation successful
    } catch (e) {
      print('Error adding to balance: $e');
      // Handle errors if needed.
      return false; // Operation failed
    }
  }
}
