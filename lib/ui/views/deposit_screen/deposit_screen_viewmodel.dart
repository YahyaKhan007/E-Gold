import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DepositScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }

  void toInStorePayment() {
    _navigationService.navigateToInStorePaymentScreenView();
  }

  void toCryptoPayment() {
    _navigationService.navigateToCryptoPaymentScreenView();
  }

  void toCardPayment() {
    _navigationService.navigateToAddNewCardPaymentScreenView();
  }
}
