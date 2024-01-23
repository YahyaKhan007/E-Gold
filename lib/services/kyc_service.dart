import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/kyc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class KycService {
  User? user = FirebaseAuth.instance.currentUser;
  Future<String> uploadImage(File image) async {
    String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('${user?.uid}/$fileName');
    await storageReference.putFile(image);

    // Get download URL
    String downloadURL = await storageReference.getDownloadURL();

    // Save download URL in Firestore

    print('Image uploaded and link saved.');

    // Return the download URL as a String
    return downloadURL;
  }

  Future<void> saveKYCData(KYC kycData) async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Document reference under the "users" collection with the user's UID
      DocumentReference userDocument = usersCollection.doc(uid);

      // Save KYC data to the "kyc" subcollection
      await userDocument.collection('kyc').doc().set(kycData.toJson());

      print('KYC data saved successfully!');
    } catch (e) {
      print('Error saving KYC data: $e');
    }
  }

  Future<bool> isKycApproved() async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Document reference under the "users" collection with the user's UID
      DocumentReference userDocument = usersCollection.doc(uid);

      // Reference to the "kyc" subcollection within the user document
      CollectionReference kycCollection = userDocument.collection('kyc');

      // Get the documents in the "kyc" subcollection
      QuerySnapshot kycDocuments = await kycCollection.get();

      // Check if the "kyc" subcollection exists and has documents
      if (kycDocuments.docs.isNotEmpty) {
        // Get the first document in the "kyc" subcollection
        DocumentSnapshot kycDocument = kycDocuments.docs.first;

        // Check if the "isApproved" field exists and is true
        return kycDocument.exists && kycDocument.get('isApproved') == true;
      } else {
        // If "kyc" subcollection doesn't exist or is empty
        return false;
      }
    } catch (e) {
      print('Error checking KYC approval status: $e');
      return false;
    }
  }

  Future<bool> doesKycCollectionExist() async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Document reference under the "users" collection with the user's UID
      DocumentReference userDocument = usersCollection.doc(uid);

      // Reference to the "kyc" subcollection within the user document
      CollectionReference kycCollection = userDocument.collection('kyc');

      // Get the documents in the "kyc" subcollection
      QuerySnapshot kycDocuments = await kycCollection.get();

      // Check if there are any documents in the "kyc" subcollection
      return kycDocuments.docs.isNotEmpty;
    } catch (e) {
      print('Error checking for the existence of KYC collection: $e');
      return false;
    }
  }
}
