import 'package:e_gold/services/auth_service.dart';
import 'package:e_gold/services/kyc_service.dart';
import 'package:e_gold/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:e_gold/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:e_gold/ui/views/dashboard_screen/dashboard_screen_view.dart';
import 'package:e_gold/ui/views/home/home_view.dart';
import 'package:e_gold/ui/views/auth_views/login/login_view.dart';
import 'package:e_gold/ui/views/notification_screen/notification_screen_view.dart';
import 'package:e_gold/ui/views/startup/startup_view.dart';
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:e_gold/ui/views/auth_views/signup/signup_view.dart';
import 'package:e_gold/ui/views/auth_views/createanaccount/createanaccount_view.dart';
import 'package:e_gold/ui/views/auth_views/forgetpassword/forgetpassword_view.dart';
import 'package:e_gold/ui/views/auth_views/otpverification/otpverification_view.dart';
import 'package:e_gold/ui/views/auth_views/receiveotpverification/receiveotpverification_view.dart';
import 'package:e_gold/ui/views/auth_views/changepassword/changepassword_view.dart';
import 'package:e_gold/ui/views/kyc/kyc_view.dart';
import 'package:e_gold/ui/views/statistic/statistic_view.dart';

import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_view.dart';
import 'package:e_gold/ui/views/kycidcardfront/kycidcardfront_view.dart';
import 'package:e_gold/ui/views/kycidcardback/kycidcardback_view.dart';
import 'package:e_gold/ui/views/kycbankaccount/kycbankaccount_view.dart';
import 'package:e_gold/ui/views/kycprofile/kycprofile_view.dart';
import 'package:e_gold/ui/views/kycpassport/kycpassport_view.dart';
import 'package:e_gold/ui/views/dashboard_screen/dashboard_screen_view.dart';
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart';
import 'package:e_gold/ui/views/notification_screen/notification_screen_view.dart';
import 'package:e_gold/ui/views/account_screen/account_screen_view.dart';
import 'package:e_gold/ui/views/statistic/statistic_view.dart';

import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_view.dart';
import 'package:e_gold/ui/views/kycidcardfront/kycidcardfront_view.dart';
import 'package:e_gold/ui/views/kycidcardback/kycidcardback_view.dart';
import 'package:e_gold/ui/views/kycbankaccount/kycbankaccount_view.dart';
import 'package:e_gold/ui/views/kycprofile/kycprofile_view.dart';
import 'package:e_gold/ui/views/kycpassport/kycpassport_view.dart';
import 'package:e_gold/ui/views/deposit_screen/deposit_screen_view.dart';
import 'package:e_gold/ui/views/in_store_payment_screen/in_store_payment_screen_view.dart';
import 'package:e_gold/ui/views/crypto_payment_screen/crypto_payment_screen_view.dart';
import 'package:e_gold/ui/views/card_payment_screen/card_payment_screen_view.dart';
import 'package:e_gold/ui/views/add_new_card_payment_screen/add_new_card_payment_screen_view.dart';
import 'package:e_gold/ui/views/add_crypto_screen/add_crypto_screen_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(
      page: StartupView,
    ),
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: CreateanaccountView),
    MaterialRoute(page: DashboardScreenView),
    MaterialRoute(page: ForgetpasswordView),
    MaterialRoute(page: OtpverificationView),
    MaterialRoute(page: ReceiveotpverificationView),
    MaterialRoute(page: ChangepasswordView),
    MaterialRoute(page: KycView),
    MaterialRoute(page: StatisticView),
    MaterialRoute(page: BuygoldorsilverView),
    MaterialRoute(page: KycidcardfrontView),
    MaterialRoute(page: NotificationScreenView),
    MaterialRoute(page: TransactionHistoryScreenView),
    MaterialRoute(page: KycidcardbackView),
    MaterialRoute(page: KycbankaccountView),
    MaterialRoute(page: KycprofileView),
    MaterialRoute(page: KycpassportView),
    MaterialRoute(page: NotificationScreenView),
    MaterialRoute(page: AccountScreenView),
    MaterialRoute(page: StatisticView),
    MaterialRoute(page: BuyGoldOrSilverView),
    MaterialRoute(page: KycidcardfrontView),
    MaterialRoute(page: KycidcardbackView),
    MaterialRoute(page: KycbankaccountView),
    MaterialRoute(page: KycprofileView),
    MaterialRoute(page: KycpassportView),
    MaterialRoute(page: DepositScreenView),
    MaterialRoute(page: InStorePaymentScreenView),
    MaterialRoute(page: CryptoPaymentScreenView),
    MaterialRoute(page: CardPaymentScreenView),
    MaterialRoute(page: AddNewCardPaymentScreenView),
    MaterialRoute(page: AddCryptoScreenView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: KycService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
