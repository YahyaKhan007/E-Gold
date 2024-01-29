import 'package:e_gold/app/app.bottomsheets.dart';
import 'package:e_gold/app/app.dialogs.dart';
import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void seeAll() {
    _navigationService.navigateToTransactionHistoryScreenView(check: true);
  }

  void notification() {
    _navigationService.navigateToNotificationScreenView();
  }

  void goldContainer() {
    _navigationService.navigateToGoldbalancehistoryView();
  }

  void silverContainer() {
    _navigationService.navigateToSliverbalancehistoryView();
  }

  void onTapSell() {}
}
