import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SpeceficSellTransactionViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void onBack() {
    navigationService.back();
  }

  String formattedDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat('MMMM d, y H:mm').format(dateTime);
  }
}
