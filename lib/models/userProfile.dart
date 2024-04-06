import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String name;
  String email;
  String uid;
  String phoneNumber;
  String countryCode;
  String dateOfBirth;
  Timestamp? createdAt;
  String profileImg;
  bool isAdmin;

  UserProfile({
    required this.name,
    required this.countryCode,
    required this.email,
    required this.uid,
    required this.profileImg,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.createdAt,
    required this.isAdmin,
  });

  // Method to convert the object to a Map for storing in Firestore
  Map<String, dynamic> toJson() {
    return {
      'isAdmin': isAdmin,
      'name': name,
      'email': email,
      'countryCode': countryCode,
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
      isAdmin: json['isAdmin'],
      countryCode: json['countryCode'],
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
      isAdmin: data['isAdmin'],
      name: data['name'],
      email: data['email'],
      countryCode: data['countryCode'],
      uid: data['uid'],
      profileImg: data['profileImg'],
      phoneNumber: data['phoneNumber'],
      dateOfBirth: data['dateOfBirth'],
      createdAt: data['createdAt'],
    );
  }
}
