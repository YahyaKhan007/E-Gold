import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/bank_service.dart';
import 'package:e_gold/services/crypto_service.dart';
import 'package:e_gold/services/transaction_service.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class StartupViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final userProfileService = locator<UserProfileService>();
  final _transactionService = locator<TransactionDetailsService>();
  bool isLogin = true;
  final bankService = locator<BankService>();
  final cryptoService = locator<CryptoService>();
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await userProfileService.getUser();
    await Future.delayed(const Duration(seconds: 3));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await bankService.getBankData();
      await cryptoService.getCryptoData();
      // User is already logged
      await _transactionService.getAllTransactionDetails(user.uid);
      navigationService.replaceWithDashboardScreenView();
    } else {
      navigationService.replaceWithLoginView();
    }

    rebuildUi();
  }

  void getStarted() {
    navigationService.navigateToCreateanaccountView();
  }

  void onPressedAlreadyHaveAnAccount() {
    navigationService.replaceWithLoginView();
  }
}
