import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class PrivacyPolicyViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void onBack() {
    navigationService.back();
  }
}
