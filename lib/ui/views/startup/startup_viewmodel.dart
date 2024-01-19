import 'package:e_gold/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class StartupViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  bool isLogin = true;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    isLogin = !isLogin;
    rebuildUi();
  }

  void getStarted() {
    navigationService.navigateToCreateanaccountView();
  }

  void onPressedAlreadyHaveAnAccount() {
    navigationService.replaceWithLoginView();
  }
}
