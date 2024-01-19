import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountScreenViewModel extends BaseViewModel {
  final authService = locator<AuthService>();
  final navigationService = locator<NavigationService>();
  void logout() {
    authService.signOut();
    navigationService.replaceWithLoginView();
  }
}
