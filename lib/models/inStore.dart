import 'package:cloud_firestore/cloud_firestore.dart';

class InStore {
  String uid;
  double balance;

  InStore({
    required this.uid,
    required this.balance,
  });

  // Factory method to create a Bank instance from JSON data
  factory InStore.fromJson(Map<String, dynamic> json) {
    return InStore(
      uid: json['uid'],
      balance: json['balance'],
    );
  }

  // Factory method to create a Bank instance from a Firestore snapshot
  factory InStore.fromSnapshot(DocumentSnapshot snapshot) {
    return InStore(
      uid: snapshot['uid'],
      balance: snapshot['balance'],
    );
  }

  // Method to convert a Bank instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'balance': balance,
    };
  }
}
