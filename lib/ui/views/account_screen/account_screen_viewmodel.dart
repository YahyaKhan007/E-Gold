import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/services/kyc_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AccountScreenViewModel extends BaseViewModel {
  final authService = locator<AuthService>();
  final kycService = locator<KycService>();
  final snackbarService = locator<SnackbarService>();

  final navigationService = locator<NavigationService>();

  bool isNavigating = false;
  void logout() {
    authService.signOut();
    navigationService.replaceWithLoginView();
  }

  void kyc() async {
    bool kycCollectionExists = await kycService.doesKycCollectionExist();
    if (kycCollectionExists) {
      bool isApproved = await kycService.isKycApproved();
      if (isApproved) {
        navigationService.replaceWithKycApprovedView(isApproved: isApproved);
      } else {
        navigationService.replaceWithKycApprovedView(isApproved: isApproved);
      }
    } else {
      navigationService.navigateToKycView();
    }
  }

  void addPaymentMethod() {
    navigationService.navigateToDepositScreenView();
  }

  void onTapEditProfile() {
    // isNavigating = true;
    navigationService.navigateToEditProfileView(isProperAccount: true);
    // isNavigating = false;
    // rebuildUi();
  }

  void onTapChangePassword() {
    navigationService.navigateToChangePasswordView();
  }

  void fundHistory() {
    navigationService.navigateToStatisticView();
  }
}
