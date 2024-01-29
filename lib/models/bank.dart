import 'package:cloud_firestore/cloud_firestore.dart';

class Bank {
  int balance;

  Bank({
    required this.balance,
  });

  // Factory method to create a Bank instance from JSON data
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      balance: json['balance'],
    );
  }

  // Factory method to create a Bank instance from a Firestore snapshot
  factory Bank.fromSnapshot(DocumentSnapshot snapshot) {
    return Bank(
      balance: snapshot['balance'],
    );
  }

  // Method to convert a Bank instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
    };
  }
}
