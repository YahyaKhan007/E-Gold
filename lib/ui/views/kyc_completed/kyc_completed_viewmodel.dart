import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class KycCompletedViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  void onPressedBackToHome() {
    navigationService.replaceWithDashboardScreenView();
  }
}
