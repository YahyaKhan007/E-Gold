import 'package:cloud_firestore/cloud_firestore.dart';

class InStore {
  String uid;
  double balance;
  double? margin;

  InStore({
    required this.uid,
    required this.balance,
    this.margin,
  });

  // Factory method to create a Bank instance from JSON data
  factory InStore.fromJson(Map<String, dynamic> json) {
    return InStore(
      uid: json['uid'],
      balance: json['balance'],
      margin: json['margin'],
    );
  }

  // Factory method to create a Bank instance from a Firestore snapshot
  factory InStore.fromSnapshot(DocumentSnapshot snapshot) {
    return InStore(
      uid: snapshot['uid'],
      balance: snapshot['balance'],
      margin: snapshot['margin'],
    );
  }

  // Method to convert a Bank instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'balance': balance,
      'margin': balance,
    };
  }
}
