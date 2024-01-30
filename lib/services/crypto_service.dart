import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/crypto.dart';
import 'package:e_gold/services/userProfileService.dart';

class CryptoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userService = locator<UserProfileService>();

  Crypto? cryptoData;
  getCryptoData() async {
    cryptoData = await getCryptoFromWallet();
  }

  // Function to get the Crypto from the 'crypto' subcollection within 'wallet' for a specific user
  Future<Crypto?> getCryptoFromWallet() async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'crypto' subcollection within the 'wallet' subcollection
      CollectionReference cryptoRef =
          walletRef.doc('balance').collection('crypto');

      // Use the specific document ID for the crypto document (e.g., 'cryptoData')
      DocumentReference specificCryptoRef = cryptoRef.doc('cryptoData');

      // Get the document from the 'crypto' subcollection
      DocumentSnapshot documentSnapshot = await specificCryptoRef.get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document to a Crypto instance
        return Crypto.fromSnapshot(documentSnapshot);
      } else {
        // Return null if the document doesn't exist
        return null;
      }
    } catch (error) {
      print('Error getting crypto from wallet: $error');
      // Handle error as needed
      return null;
    }
  }

  // Function to add a Crypto to the 'crypto' subcollection within 'wallet' for a specific user
  Future<bool> addCryptoToWallet(Crypto cryptoData) async {
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

      // Reference to the 'crypto' subcollection within the 'wallet' subcollection
      CollectionReference cryptoRef = balanceRef.collection('crypto');

      // Use a specific document ID for the crypto document (e.g., 'cryptoData')
      DocumentReference specificCryptoRef = cryptoRef.doc('cryptoData');

      // Convert the Crypto instance to JSON data
      Map<String, dynamic> cryptoJson = cryptoData.toJson();

      // Set (add/update) the crypto data in the 'crypto' subcollection
      print('Updating existing document: ${specificCryptoRef.id}');
      await specificCryptoRef.set(cryptoJson);

      // Return true if the operation is successful
      return true;
    } catch (error) {
      print('Error adding crypto to wallet: $error');
      // Return false if there is an error
      return false;
    }
  }

  // Function to check if the 'crypto' subcollection exists within 'wallet' for a specific user
  Future<bool> doesCryptoCollectionExist() async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'crypto' subcollection within the 'wallet' subcollection
      CollectionReference cryptoRef =
          walletRef.doc('balance').collection('crypto');

      // Get the documents from the 'crypto' subcollection (limit 1)
      QuerySnapshot querySnapshot = await cryptoRef.limit(1).get();

      // Check if there is at least one document in the 'crypto' subcollection
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      print('Error checking if crypto collection exists: $error');
      // Handle error as needed
      return false;
    }
  }

  // Function to add/update a Crypto to the 'crypto' subcollection within 'wallet' for a specific user
  Future<bool> addBalanceToCryptoWallet(double amount) async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'balance' document within the 'wallet' subcollection
      DocumentReference balanceRef = walletRef.doc('balance');

      // Reference to the 'crypto' subcollection within the 'wallet' subcollection
      CollectionReference cryptoRef = balanceRef.collection('crypto');

      // Use a specific document ID for the crypto document (e.g., 'cryptoData')
      DocumentReference specificCryptoRef = cryptoRef.doc('cryptoData');

      // Get the current crypto data to preserve other fields
      Crypto? existingCryptoData = await getCryptoFromWallet();

      // Update the 'balance' field in the crypto data
      if (existingCryptoData != null) {
        existingCryptoData.balance = existingCryptoData.balance! + amount;
      }

      // Convert the updated Crypto instance to JSON data
      Map<String, dynamic> updatedCryptoJson = existingCryptoData!.toJson();

      // Set (add/update) the crypto data in the 'crypto' subcollection
      print('Updating existing document: ${specificCryptoRef.id}');
      await specificCryptoRef.set(updatedCryptoJson);

      // Return true if the operation is successful
      return true;
    } catch (error) {
      print('Error adding/updating crypto in wallet: $error');
      // Return false if there is an error
      return false;
    }
  }

  // Function to deduct an amount from the existing balance
  Future<bool> deductFromCryptoWallet(double amount) async {
    String uid = userService.user!.uid;
    try {
      // Reference to the user document
      DocumentReference userRef = _firestore.collection('users').doc(uid);

      // Reference to the 'wallet' subcollection within the user document
      CollectionReference walletRef = userRef.collection('wallet');

      // Reference to the 'balance' document within the 'wallet' subcollection
      DocumentReference balanceRef = walletRef.doc('balance');

      // Reference to the 'crypto' subcollection within the 'wallet' subcollection
      CollectionReference cryptoRef = balanceRef.collection('crypto');

      // Use a specific document ID for the crypto document (e.g., 'cryptoData')
      DocumentReference specificCryptoRef = cryptoRef.doc('cryptoData');

      // Get the current crypto data to check the existing balance
      Crypto? existingCryptoData = await getCryptoFromWallet();

      // Check if the existing balance is sufficient for the deduction
      if (existingCryptoData != null && existingCryptoData.balance! >= amount) {
        // Update the 'balance' field in the crypto data
        existingCryptoData.balance = existingCryptoData.balance! - amount;

        // Convert the updated Crypto instance to JSON data
        Map<String, dynamic> updatedCryptoJson = existingCryptoData.toJson();

        // Set (add/update) the crypto data in the 'crypto' subcollection
        print('Updating existing document: ${specificCryptoRef.id}');
        await specificCryptoRef.set(updatedCryptoJson);

        // Return true if the deduction is successful
        return true;
      } else {
        // Return false if the existing balance is insufficient for the deduction
        print('Insufficient balance for deduction');
        return false;
      }
    } catch (error) {
      print('Error deducting from crypto in wallet: $error');
      // Return false if there is an error
      return false;
    }
  }
}
