import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String name;
  String email;
  String uid;
  String phoneNumber;
  String dateOfBirth;
  Timestamp? createdAt;
  String profileImg;
  double balance;

  UserProfile({
    required this.name,
    required this.email,
    required this.uid,
    required this.profileImg,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.balance,
    required this.createdAt,
  });

  // Method to convert the object to a Map for storing in Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'balance': balance,
      'uid': uid,
      'profileImg': profileImg,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'createdAt': createdAt,
    };
  }

  // Factory method to create an object from JSON data
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      balance: json['balance'],
      profileImg: json['profileImg'],
      email: json['email'],
      uid: json['uid'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'],
      createdAt:
          json['createdAt'] == null ? null : (json['createdAt'] as Timestamp),
    );
  } // Factory method to create an object from Firestore snapshot
  factory UserProfile.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return UserProfile(
      name: data['name'],
      email: data['email'],
      balance: data['balance'],
      uid: data['uid'],
      profileImg: data['profileImg'],
      phoneNumber: data['phoneNumber'],
      dateOfBirth: data['dateOfBirth'],
      createdAt: data['createdAt'],
    );
  }
}
