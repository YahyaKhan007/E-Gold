import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpverificationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void onPressedReceiveOTP() {
    _navigationService.navigateToReceiveotpverificationView();
  }
}
