import 'package:cloud_firestore/cloud_firestore.dart';

class Crypto {
  String walletAddress;
  double balance;
  double? margin;
  String securityPin;

  Crypto({
    required this.walletAddress,
    required this.securityPin,
    this.balance = 0.0,
    this.margin = 0.0,
  });

  // Factory method to create a Bank instance from JSON data
  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      walletAddress: json['walletAddress'],
      securityPin: json['securityPin'],
      balance: json['balance'],
      margin: json['margin'],
    );
  }

  // Factory method to create a Bank instance from a Firestore snapshot
  factory Crypto.fromSnapshot(DocumentSnapshot snapshot) {
    return Crypto(
      walletAddress: snapshot['walletAddress'],
      securityPin: snapshot['securityPin'],
      balance: snapshot['balance'],
      margin: snapshot['margin'],
    );
  }

  // Method to convert a Bank instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'walletAddress': walletAddress,
      'securityPin': securityPin,
      'balance': balance,
      'margin': margin,
    };
  }
}
