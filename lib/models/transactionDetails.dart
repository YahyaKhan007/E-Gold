import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDetails {
  String status;
  double totalPaid;
  double totalBonus;
  double totalGoldBought;
  String withdrawMethod;
  String transactionType;
  String walletType;
  Timestamp transactionDate;
  String transactionId;

  // Constructor
  TransactionDetails({
    required this.status,
    required this.totalPaid,
    required this.totalBonus,
    required this.totalGoldBought,
    required this.withdrawMethod,
    required this.walletType,
    required this.transactionType,
    required this.transactionDate,
    required this.transactionId,
  });

  // Convert the model to a Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalPaid': totalPaid,
      'totalBonus': totalBonus,
      'transactionType': transactionType,
      'totalGoldBought': totalGoldBought,
      'withdrawMethod': withdrawMethod,
      'walletType': walletType,
      'transactionDate': transactionDate,
      'transactionId': transactionId,
    };
  }

  // Create a model from Firebase JSON data
  factory TransactionDetails.fromMap(Map<String, dynamic> map) {
    return TransactionDetails(
      status: map['status'],
      totalPaid: map['totalPaid'],
      transactionType: map['transactionType'],
      totalBonus: map['totalBonus'],
      totalGoldBought: map['totalGoldBought'],
      withdrawMethod: map['withdrawMethod'],
      walletType: map['walletType'],
      transactionDate: map['transactionDate'] as Timestamp,
      transactionId: map['transactionId'],
    );
  }

  // Convert the model to JSON string
  String toJson() => json.encode(toMap());

  // Create a model from JSON string
  factory TransactionDetails.fromJson(String source) =>
      TransactionDetails.fromMap(json.decode(source));

  toList() {}
}
