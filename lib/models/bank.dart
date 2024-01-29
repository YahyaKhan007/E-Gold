import 'package:cloud_firestore/cloud_firestore.dart';

class Bank {
  String bankName;
  String accountNumber;
  String swiftCode;

  Bank({
    required this.bankName,
    required this.accountNumber,
    required this.swiftCode,
  });

  // Factory method to create a Bank instance from JSON data
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      swiftCode: json['swiftCode'],
    );
  }

  // Factory method to create a Bank instance from a Firestore snapshot
  factory Bank.fromSnapshot(DocumentSnapshot snapshot) {
    return Bank(
      bankName: snapshot['bankName'],
      accountNumber: snapshot['accountNumber'],
      swiftCode: snapshot['swiftCode'],
    );
  }

  // Method to convert a Bank instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'bankName': bankName,
      'accountNumber': accountNumber,
      'swiftCode': swiftCode,
    };
  }
}
