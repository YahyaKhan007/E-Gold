import 'package:cloud_firestore/cloud_firestore.dart';

class SandPModel {
  final String uid;
  final Timestamp createdAt;

  SandPModel({
    required this.uid,
    required this.createdAt,
  });

  factory SandPModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return SandPModel(
      uid: doc.id,
      createdAt: (data['createdAt'] as Timestamp?) ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'createdAt': createdAt,
    };
  }
}

class PurchaseModel {
  final String uid;
  final Timestamp createdAt;
  final double price;

  PurchaseModel({
    required this.uid,
    required this.createdAt,
    required this.price,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      uid: json['uid'] ?? '',
      createdAt: json['createdAt'] ?? Timestamp.now(),
      price: (json['price'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'createdAt': createdAt,
      'price': price,
    };
  }
}

class SaleModel {
  final String uid;
  final Timestamp createdAt;
  final double price;

  SaleModel({
    required this.uid,
    required this.createdAt,
    required this.price,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) {
    return SaleModel(
      uid: json['uid'] ?? '',
      createdAt: json['createdAt'] ?? Timestamp.now(),
      price: (json['price'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'createdAt': createdAt,
      'price': price,
    };
  }
}
