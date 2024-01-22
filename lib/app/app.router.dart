// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_gold/ui/views/account_screen/account_screen_view.dart'
    as _i15;
import 'package:e_gold/ui/views/add_new_card_payment_screen/add_new_card_payment_screen_view.dart'
    as _i27;
import 'package:e_gold/ui/views/auth_views/changepassword/changepassword_view.dart'
    as _i10;
import 'package:e_gold/ui/views/auth_views/createanaccount/createanaccount_view.dart'
    as _i6;
import 'package:e_gold/ui/views/auth_views/forgetpassword/forgetpassword_view.dart'
    as _i7;
import 'package:e_gold/ui/views/auth_views/login/login_view.dart' as _i4;
import 'package:e_gold/ui/views/auth_views/otpverification/otpverification_view.dart'
    as _i8;
import 'package:e_gold/ui/views/auth_views/receiveotpverification/receiveotpverification_view.dart'
    as _i9;
import 'package:e_gold/ui/views/auth_views/signup/signup_view.dart' as _i5;
import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_view.dart'
    as _i17;
import 'package:e_gold/ui/views/card_payment_screen/card_payment_screen_view.dart'
    as _i26;
import 'package:e_gold/ui/views/crypto_payment_screen/crypto_payment_screen_view.dart'
    as _i25;
import 'package:e_gold/ui/views/dashboard_screen/dashboard_screen_view.dart'
    as _i12;
import 'package:e_gold/ui/views/deposit_screen/deposit_screen_view.dart'
    as _i23;
import 'package:e_gold/ui/views/home/home_view.dart' as _i2;
import 'package:e_gold/ui/views/in_store_payment_screen/in_store_payment_screen_view.dart'
    as _i24;
import 'package:e_gold/ui/views/kyc/kyc_view.dart' as _i11;
import 'package:e_gold/ui/views/kycbankaccount/kycbankaccount_view.dart'
    as _i20;
import 'package:e_gold/ui/views/kycidcardback/kycidcardback_view.dart' as _i19;
import 'package:e_gold/ui/views/kycidcardfront/kycidcardfront_view.dart'
    as _i18;
import 'package:e_gold/ui/views/kycpassport/kycpassport_view.dart' as _i22;
import 'package:e_gold/ui/views/kycprofile/kycprofile_view.dart' as _i21;
import 'package:e_gold/ui/views/notification_screen/notification_screen_view.dart'
    as _i14;
import 'package:e_gold/ui/views/startup/startup_view.dart' as _i3;
import 'package:e_gold/ui/views/statistic/statistic_view.dart' as _i16;
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart'
    as _i13;
import 'package:flutter/material.dart' as _i28;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i29;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/';

  static const signupView = '/signup-view';

  static const createanaccountView = '/createanaccount-view';

  static const forgetpasswordView = '/forgetpassword-view';

  static const otpverificationView = '/otpverification-view';

  static const receiveotpverificationView = '/receiveotpverification-view';

  static const changepasswordView = '/changepassword-view';

  static const kycView = '/kyc-view';

  static const dashboardScreenView = '/dashboard-screen-view';

  static const transactionHistoryScreenView =
      '/transaction-history-screen-view';

  static const notificationScreenView = '/notification-screen-view';

  static const accountScreenView = '/account-screen-view';

  static const statisticView = '/statistic-view';

  static const buyGoldOrSilverView = '/buy-gold-or-silver-view';

  static const kycidcardfrontView = '/kycidcardfront-view';

  static const kycidcardbackView = '/kycidcardback-view';

  static const kycbankaccountView = '/kycbankaccount-view';

  static const kycprofileView = '/kycprofile-view';

  static const kycpassportView = '/kycpassport-view';

  static const depositScreenView = '/deposit-screen-view';

  static const inStorePaymentScreenView = '/in-store-payment-screen-view';

  static const cryptoPaymentScreenView = '/crypto-payment-screen-view';

  static const cardPaymentScreenView = '/card-payment-screen-view';

  static const addNewCardPaymentScreenView =
      '/add-new-card-payment-screen-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    signupView,
    createanaccountView,
    forgetpasswordView,
    otpverificationView,
    receiveotpverificationView,
    changepasswordView,
    kycView,
    dashboardScreenView,
    transactionHistoryScreenView,
    notificationScreenView,
    accountScreenView,
    statisticView,
    buyGoldOrSilverView,
    kycidcardfrontView,
    kycidcardbackView,
    kycbankaccountView,
    kycprofileView,
    kycpassportView,
    depositScreenView,
    inStorePaymentScreenView,
    cryptoPaymentScreenView,
    cardPaymentScreenView,
    addNewCardPaymentScreenView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i5.SignupView,
    ),
    _i1.RouteDef(
      Routes.createanaccountView,
      page: _i6.CreateanaccountView,
    ),
    _i1.RouteDef(
      Routes.forgetpasswordView,
      page: _i7.ForgetpasswordView,
    ),
    _i1.RouteDef(
      Routes.otpverificationView,
      page: _i8.OtpverificationView,
    ),
    _i1.RouteDef(
      Routes.receiveotpverificationView,
      page: _i9.ReceiveotpverificationView,
    ),
    _i1.RouteDef(
      Routes.changepasswordView,
      page: _i10.ChangepasswordView,
    ),
    _i1.RouteDef(
      Routes.kycView,
      page: _i11.KycView,
    ),
    _i1.RouteDef(
      Routes.dashboardScreenView,
      page: _i12.DashboardScreenView,
    ),
    _i1.RouteDef(
      Routes.transactionHistoryScreenView,
      page: _i13.TransactionHistoryScreenView,
    ),
    _i1.RouteDef(
      Routes.notificationScreenView,
      page: _i14.NotificationScreenView,
    ),
    _i1.RouteDef(
      Routes.accountScreenView,
      page: _i15.AccountScreenView,
    ),
    _i1.RouteDef(
      Routes.statisticView,
      page: _i16.StatisticView,
    ),
    _i1.RouteDef(
      Routes.buyGoldOrSilverView,
      page: _i17.BuyGoldOrSilverView,
    ),
    _i1.RouteDef(
      Routes.kycidcardfrontView,
      page: _i18.KycidcardfrontView,
    ),
    _i1.RouteDef(
      Routes.kycidcardbackView,
      page: _i19.KycidcardbackView,
    ),
    _i1.RouteDef(
      Routes.kycbankaccountView,
      page: _i20.KycbankaccountView,
    ),
    _i1.RouteDef(
      Routes.kycprofileView,
      page: _i21.KycprofileView,
    ),
    _i1.RouteDef(
      Routes.kycpassportView,
      page: _i22.KycpassportView,
    ),
    _i1.RouteDef(
      Routes.depositScreenView,
      page: _i23.DepositScreenView,
    ),
    _i1.RouteDef(
      Routes.inStorePaymentScreenView,
      page: _i24.InStorePaymentScreenView,
    ),
    _i1.RouteDef(
      Routes.cryptoPaymentScreenView,
      page: _i25.CryptoPaymentScreenView,
    ),
    _i1.RouteDef(
      Routes.cardPaymentScreenView,
      page: _i26.CardPaymentScreenView,
    ),
    _i1.RouteDef(
      Routes.addNewCardPaymentScreenView,
      page: _i27.AddNewCardPaymentScreenView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.SignupView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignupView(),
        settings: data,
      );
    },
    _i6.CreateanaccountView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CreateanaccountView(),
        settings: data,
      );
    },
    _i7.ForgetpasswordView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ForgetpasswordView(),
        settings: data,
      );
    },
    _i8.OtpverificationView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.OtpverificationView(),
        settings: data,
      );
    },
    _i9.ReceiveotpverificationView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ReceiveotpverificationView(),
        settings: data,
      );
    },
    _i10.ChangepasswordView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ChangepasswordView(),
        settings: data,
      );
    },
    _i11.KycView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.KycView(),
        settings: data,
      );
    },
    _i12.DashboardScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.DashboardScreenView(),
        settings: data,
      );
    },
    _i13.TransactionHistoryScreenView: (data) {
      final args =
          data.getArgs<TransactionHistoryScreenViewArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.TransactionHistoryScreenView(key: args.key, check: args.check),
        settings: data,
      );
    },
    _i14.NotificationScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.NotificationScreenView(),
        settings: data,
      );
    },
    _i15.AccountScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.AccountScreenView(),
        settings: data,
      );
    },
    _i16.StatisticView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.StatisticView(),
        settings: data,
      );
    },
    _i17.BuyGoldOrSilverView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.BuyGoldOrSilverView(),
        settings: data,
      );
    },
    _i18.KycidcardfrontView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.KycidcardfrontView(),
        settings: data,
      );
    },
    _i19.KycidcardbackView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.KycidcardbackView(),
        settings: data,
      );
    },
    _i20.KycbankaccountView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.KycbankaccountView(),
        settings: data,
      );
    },
    _i21.KycprofileView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.KycprofileView(),
        settings: data,
      );
    },
    _i22.KycpassportView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.KycpassportView(),
        settings: data,
      );
    },
    _i23.DepositScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.DepositScreenView(),
        settings: data,
      );
    },
    _i24.InStorePaymentScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.InStorePaymentScreenView(),
        settings: data,
      );
    },
    _i25.CryptoPaymentScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.CryptoPaymentScreenView(),
        settings: data,
      );
    },
    _i26.CardPaymentScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.CardPaymentScreenView(),
        settings: data,
      );
    },
    _i27.AddNewCardPaymentScreenView: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.AddNewCardPaymentScreenView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class TransactionHistoryScreenViewArguments {
  const TransactionHistoryScreenViewArguments({
    this.key,
    required this.check,
  });

  final _i28.Key? key;

  final bool check;

  @override
  String toString() {
    return '{"key": "$key", "check": "$check"}';
  }

  @override
  bool operator ==(covariant TransactionHistoryScreenViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.check == check;
  }

  @override
  int get hashCode {
    return key.hashCode ^ check.hashCode;
  }
}

extension NavigatorStateExtension on _i29.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateanaccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createanaccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgetpasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgetpasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpverificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.otpverificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReceiveotpverificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.receiveotpverificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangepasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changepasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kycView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionHistoryScreenView({
    _i28.Key? key,
    required bool check,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transactionHistoryScreenView,
        arguments:
            TransactionHistoryScreenViewArguments(key: key, check: check),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStatisticView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.statisticView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBuyGoldOrSilverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buyGoldOrSilverView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycidcardfrontView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kycidcardfrontView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycidcardbackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kycidcardbackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycbankaccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kycbankaccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycprofileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kycprofileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycpassportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kycpassportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDepositScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.depositScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInStorePaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.inStorePaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCryptoPaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cryptoPaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCardPaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cardPaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddNewCardPaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addNewCardPaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateanaccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createanaccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgetpasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgetpasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpverificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.otpverificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReceiveotpverificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.receiveotpverificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangepasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changepasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kycView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionHistoryScreenView({
    _i28.Key? key,
    required bool check,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transactionHistoryScreenView,
        arguments:
            TransactionHistoryScreenViewArguments(key: key, check: check),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStatisticView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.statisticView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBuyGoldOrSilverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buyGoldOrSilverView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycidcardfrontView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kycidcardfrontView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycidcardbackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kycidcardbackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycbankaccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kycbankaccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycprofileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kycprofileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycpassportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kycpassportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDepositScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.depositScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInStorePaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.inStorePaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCryptoPaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cryptoPaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCardPaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cardPaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddNewCardPaymentScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addNewCardPaymentScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
