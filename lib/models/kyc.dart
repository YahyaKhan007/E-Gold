import 'package:cloud_firestore/cloud_firestore.dart';

class KYC {
  String cnicNumber;
  String cardFrontPhotoLink;
  String cardBackPhotoLink;
  String passportNumber;
  String bankAccountNumber;
  String bankName;
  String ifscCode;
  String profilePhotoLink;
  String dateOfBirth;
  bool concentAgreement;
  bool isApproved;

  KYC({
    required this.cnicNumber,
    required this.cardFrontPhotoLink,
    required this.cardBackPhotoLink,
    required this.passportNumber,
    required this.bankAccountNumber,
    required this.bankName,
    required this.concentAgreement,
    required this.isApproved,
    required this.ifscCode,
    required this.profilePhotoLink,
    required this.dateOfBirth,
  });

  // Method to convert the object to a Map for storing in Firestore
  Map<String, dynamic> toJson() {
    return {
      'cnicNumber': cnicNumber,
      'cardFrontPhotoLink': cardFrontPhotoLink,
      'cardBackPhotoLink': cardBackPhotoLink,
      'passportNumber': passportNumber,
      'bankAccountNumber': bankAccountNumber,
      'bankName': bankName,
      'concentAgreement': concentAgreement,
      'ifscCode': ifscCode,
      'isApproved': isApproved,
      'profilePhotoLink': profilePhotoLink,
      'dateOfBirth': dateOfBirth,
    };
  }

  // Factory method to create an object from JSON data
  factory KYC.fromJson(Map<String, dynamic> json) {
    return KYC(
      concentAgreement: json['concentAgreement'],
      cnicNumber: json['cnicNumber'],
      cardFrontPhotoLink: json['cardFrontPhotoLink'],
      cardBackPhotoLink: json['cardBackPhotoLink'],
      passportNumber: json['passportNumber'],
      bankAccountNumber: json['bankAccountNumber'],
      bankName: json['bankName'],
      ifscCode: json['ifscCode'],
      isApproved: json['isApproved'],
      profilePhotoLink: json['profilePhotoLink'],
      dateOfBirth: json['dateOfBirth'],
    );
  }
}
