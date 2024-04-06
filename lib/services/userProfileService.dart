import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/userProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfileService {
  UserProfile? user;
  getUser() async {
    user = await getUserProfileFromFirestore();
  }

  cleanUser() {
    user = null;
  }

  Future<void> addUserToFirestore(UserProfile userProfile) async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Document reference under the "users" collection with the user's UID
      DocumentReference userDocument = usersCollection.doc(uid);

      // Convert UserProfile object to Map using toJson method
      Map<String, dynamic> userData = userProfile.toJson();

      // Save user data to the Firestore document
      await userDocument.set(userData);

      print('User data added to Firestore successfully!');
    } catch (e) {
      print('Error adding user data to Firestore: $e');
    }
  }

  Future<void> updateUserToFirestore(UserProfile userProfile) async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('user');

      // Document reference under the "users" collection with the user's UID
      DocumentReference userDocument = usersCollection.doc(uid);

      // Convert UserProfile object to Map using toJson method
      Map<String, dynamic> userData = userProfile.toJson();

      // Save user data to the Firestore document
      await userDocument.update(userData);

      print('User data added to Firestore successfully!');
    } catch (e) {
      print('Error adding user data to Firestore: $e');
    }
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firebase storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('$uid.jpg');

      // Upload the image file to storage
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      // Get the image URL from the storage
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image to storage: $e');
      return '';
    }
  }

  Future<UserProfile?> getUserProfileFromFirestore() async {
    try {
      // Get the current user's UID
      String uid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firestore collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      // Document reference under the "users" collection with the user's UID
      DocumentReference userDocument = usersCollection.doc(uid);

      // Get the snapshot of the document
      DocumentSnapshot userSnapshot = await userDocument.get();

      // Check if the document exists
      if (userSnapshot.exists) {
        // Create a UserProfile object from the snapshot data
        UserProfile userProfile = UserProfile.fromSnapshot(userSnapshot);

        return userProfile;
      } else {
        // If the document does not exist
        print('User document does not exist in Firestore.');
        return null;
      }
    } catch (e) {
      print('Error getting user data from Firestore: $e');
      return null;
    }
  }
}
