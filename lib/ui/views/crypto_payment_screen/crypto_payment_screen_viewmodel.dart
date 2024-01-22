import 'package:e_gold/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CryptoPaymentScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }
}
