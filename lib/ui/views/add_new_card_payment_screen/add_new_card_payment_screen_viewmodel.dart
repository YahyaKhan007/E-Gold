import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddNewCardPaymentScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }

  void pressContinue() {
    _navigationService.navigateToCardPaymentScreenView();
  }
}
