import 'package:cloud_firestore/cloud_firestore.dart';

class Bank {
  String bankName;
  String accountNumber;
  String swiftCode;
  double? balance;
  double? margin;

  Bank({
    required this.bankName,
    required this.accountNumber,
    required this.swiftCode,
    this.balance = 0.0,
    this.margin,
  });

  // Factory method to create a Bank instance from JSON data
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      swiftCode: json['swiftCode'],
      balance: json['balance'],
      margin: json['margin'],
    );
  }

  // Factory method to create a Bank instance from a Firestore snapshot
  factory Bank.fromSnapshot(DocumentSnapshot snapshot) {
    return Bank(
      bankName: snapshot['bankName'],
      accountNumber: snapshot['accountNumber'],
      swiftCode: snapshot['swiftCode'],
      balance: snapshot['balance'],
      margin: snapshot['margin'],
    );
  }

  // Method to convert a Bank instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'bankName': bankName,
      'accountNumber': accountNumber,
      'swiftCode': swiftCode,
      'balance': balance,
      'margin': balance,
    };
  }
}
