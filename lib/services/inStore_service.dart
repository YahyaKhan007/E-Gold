import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/inStore.dart';
import 'package:e_gold/services/userProfileService.dart';

class InStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userService = locator<UserProfileService>();

  InStore? instoreData;
  getInStoreData() async {
    instoreData = await getInStoreFromWallet();
  }

  // Function to get the InStore from the 'instore' subcollection within 'wallet' for a specific user
  Future<InStore?> getInStoreFromWallet() async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'instore' subcollection within the 'wallet' subcollection
      CollectionReference instoreRef =
          walletRef.doc('balance').collection('instore');

      // Use the specific document ID for the instore document (e.g., 'instoreData')
      DocumentReference specificInStoreRef = instoreRef.doc('instoreData');

      // Get the document from the 'instore' subcollection
      DocumentSnapshot documentSnapshot = await specificInStoreRef.get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document to a InStore instance
        return InStore.fromSnapshot(documentSnapshot);
      } else {
        // Return null if the document doesn't exist
        return null;
      }
    } catch (error) {
      print('Error getting instore from wallet: $error');
      // Handle error as needed
      return null;
    }
  }

  // Function to add a InStore to the 'instore' subcollection within 'wallet' for a specific user
  Future<bool> addInStoreToWallet(InStore instoreData) async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      print(uid);
      DocumentReference userRef = _firestore.collection('users').doc(uid);
      print(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'balance' document within the 'wallet' subcollection
      DocumentReference balanceRef = walletRef.doc('balance');

      // Reference to the 'instore' subcollection within the 'wallet' subcollection
      CollectionReference instoreRef = balanceRef.collection('instore');

      // Use a specific document ID for the instore document (e.g., 'instoreData')
      DocumentReference specificInStoreRef = instoreRef.doc('instoreData');

      // Convert the InStore instance to JSON data
      Map<String, dynamic> instoreJson = instoreData.toJson();

      // Set (add/update) the instore data in the 'instore' subcollection
      print('Updating existing document: ${specificInStoreRef.id}');
      await specificInStoreRef.set(instoreJson);

      // Return true if the operation is successful
      return true;
    } catch (error) {
      print('Error adding instore to wallet: $error');
      // Return false if there is an error
      return false;
    }
  }

  // Function to check if the 'instore' subcollection exists within 'wallet' for a specific user
  Future<bool> doesInStoreCollectionExist() async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'instore' subcollection within the 'wallet' subcollection
      CollectionReference instoreRef =
          walletRef.doc('balance').collection('instore');

      // Get the documents from the 'instore' subcollection (limit 1)
      QuerySnapshot querySnapshot = await instoreRef.limit(1).get();

      // Check if there is at least one document in the 'instore' subcollection
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      print('Error checking if instore collection exists: $error');
      // Handle error as needed
      return false;
    }
  }

  // Function to add/update a InStore to the 'instore' subcollection within 'wallet' for a specific user
  Future<bool> addBalanceToInStoreWallet(double amount) async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'balance' document within the 'wallet' subcollection
      DocumentReference balanceRef = walletRef.doc('balance');

      // Reference to the 'instore' subcollection within the 'wallet' subcollection
      CollectionReference instoreRef = balanceRef.collection('instore');

      // Use a specific document ID for the instore document (e.g., 'instoreData')
      DocumentReference specificInStoreRef = instoreRef.doc('instoreData');

      // Get the current instore data to preserve other fields
      InStore? existingInStoreData = await getInStoreFromWallet();

      // Update the 'balance' field in the instore data
      if (existingInStoreData != null) {
        existingInStoreData.balance = existingInStoreData.balance! + amount;
      }

      // Convert the updated InStore instance to JSON data
      Map<String, dynamic> updatedInStoreJson = existingInStoreData!.toJson();

      // Set (add/update) the instore data in the 'instore' subcollection
      print('Updating existing document: ${specificInStoreRef.id}');
      await specificInStoreRef.set(updatedInStoreJson);

      // Return true if the operation is successful
      return true;
    } catch (error) {
      print('Error adding/updating instore in wallet: $error');
      // Return false if there is an error
      return false;
    }
  }
}
