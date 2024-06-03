import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sales_and_purchase.dart';

class SalesAndPurchaseServiceService {
  final CollectionReference sAndPCollection =
      FirebaseFirestore.instance.collection('SandP');

  List<SandPModel> salesAndPurchasesList = [];

  Future<void> getAllSandP() async {
    try {
      QuerySnapshot? querySnapshot = await sAndPCollection.get();

      if (querySnapshot.docs.isEmpty) {
        print('No documents found in the collection.');
        return;
      }

      print(querySnapshot.docs.length);

      for (var doc in querySnapshot.docs) {
        print(doc.data());
        salesAndPurchasesList.add(SandPModel.fromFirestore(doc));
      }
    } catch (e) {
      // Handle error
      print('Error retrieving documents: $e');
      return;
    }
  }

  Future<void> addSandP(SandPModel salesAndPurchase) async {
    try {
      await sAndPCollection
          .add(salesAndPurchase.toFirestore())
          .then((value) => print("SandP Added"))
          .catchError((error) => print("Failed to add SandP: $error"));
    } catch (e) {
      log(e.toString());
    }
  }
}
