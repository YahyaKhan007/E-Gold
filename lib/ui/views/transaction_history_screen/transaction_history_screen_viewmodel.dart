import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionHistoryScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final transactionService = locator<TransactionDetailsService>();
  final _userService = locator<UserProfileService>();

  void goBack() {
    _navigationService.back();
  }

  String image(TransactionDetails transaction) {
    if (transaction.walletType == 'Bank') {
      return bank;
    } else if (transaction.walletType == 'Crypto') {
      return crypto;
    } else if (transaction.walletType == 'In-Store') {
      return store;
    } else if (transaction.walletType == 'Card') {
      return card;
    } else {
      return 'default_image.png';
    }
  }

  Future<void> refreshData() async {
    await transactionService.getAllTransactionDetails(_userService.user!.uid);
    rebuildUi();
  }
}
