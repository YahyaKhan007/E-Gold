// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_gold/ui/views/auth_views/changepassword/changepassword_view.dart'
    as _i11;
import 'package:e_gold/ui/views/auth_views/createanaccount/createanaccount_view.dart'
    as _i6;
import 'package:e_gold/ui/views/auth_views/forgetpassword/forgetpassword_view.dart'
    as _i8;
import 'package:e_gold/ui/views/auth_views/login/login_view.dart' as _i4;
import 'package:e_gold/ui/views/auth_views/otpverification/otpverification_view.dart'
    as _i9;
import 'package:e_gold/ui/views/auth_views/receiveotpverification/receiveotpverification_view.dart'
    as _i10;
import 'package:e_gold/ui/views/auth_views/signup/signup_view.dart' as _i5;
import 'package:e_gold/ui/views/buygoldorsilver/buygoldorsilver_view.dart'
    as _i14;
import 'package:e_gold/ui/views/dashboard_screen/dashboard_screen_view.dart'
    as _i7;
import 'package:e_gold/ui/views/home/home_view.dart' as _i2;
import 'package:e_gold/ui/views/kyc/kyc_view.dart' as _i12;
import 'package:e_gold/ui/views/kycbankaccount/kycbankaccount_view.dart'
    as _i19;
import 'package:e_gold/ui/views/kycidcardback/kycidcardback_view.dart' as _i18;
import 'package:e_gold/ui/views/kycidcardfront/kycidcardfront_view.dart'
    as _i15;
import 'package:e_gold/ui/views/kycpassport/kycpassport_view.dart' as _i21;
import 'package:e_gold/ui/views/kycprofile/kycprofile_view.dart' as _i20;
import 'package:e_gold/ui/views/notification_screen/notification_screen_view.dart'
    as _i16;
import 'package:e_gold/ui/views/startup/startup_view.dart' as _i3;
import 'package:e_gold/ui/views/statistic/statistic_view.dart' as _i13;
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart'
    as _i17;
import 'package:flutter/material.dart' as _i22;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i23;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/';

  static const signupView = '/signup-view';

  static const createanaccountView = '/createanaccount-view';

  static const dashboardScreenView = '/dashboard-screen-view';

  static const forgetpasswordView = '/forgetpassword-view';

  static const otpverificationView = '/otpverification-view';

  static const receiveotpverificationView = '/receiveotpverification-view';

  static const changepasswordView = '/changepassword-view';

  static const kycView = '/kyc-view';

  static const statisticView = '/statistic-view';

  static const buygoldorsilverView = '/buygoldorsilver-view';

  static const kycidcardfrontView = '/kycidcardfront-view';

  static const notificationScreenView = '/notification-screen-view';

  static const transactionHistoryScreenView =
      '/transaction-history-screen-view';

  static const kycidcardbackView = '/kycidcardback-view';

  static const kycbankaccountView = '/kycbankaccount-view';

  static const kycprofileView = '/kycprofile-view';

  static const kycpassportView = '/kycpassport-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    signupView,
    createanaccountView,
    dashboardScreenView,
    forgetpasswordView,
    otpverificationView,
    receiveotpverificationView,
    changepasswordView,
    kycView,
    statisticView,
    buygoldorsilverView,
    kycidcardfrontView,
    notificationScreenView,
    transactionHistoryScreenView,
    kycidcardbackView,
    kycbankaccountView,
    kycprofileView,
    kycpassportView,
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
      Routes.dashboardScreenView,
      page: _i7.DashboardScreenView,
    ),
    _i1.RouteDef(
      Routes.forgetpasswordView,
      page: _i8.ForgetpasswordView,
    ),
    _i1.RouteDef(
      Routes.otpverificationView,
      page: _i9.OtpverificationView,
    ),
    _i1.RouteDef(
      Routes.receiveotpverificationView,
      page: _i10.ReceiveotpverificationView,
    ),
    _i1.RouteDef(
      Routes.changepasswordView,
      page: _i11.ChangepasswordView,
    ),
    _i1.RouteDef(
      Routes.kycView,
      page: _i12.KycView,
    ),
    _i1.RouteDef(
      Routes.statisticView,
      page: _i13.StatisticView,
    ),
    _i1.RouteDef(
      Routes.buygoldorsilverView,
      page: _i14.BuygoldorsilverView,
    ),
    _i1.RouteDef(
      Routes.kycidcardfrontView,
      page: _i15.KycidcardfrontView,
    ),
    _i1.RouteDef(
      Routes.notificationScreenView,
      page: _i16.NotificationScreenView,
    ),
    _i1.RouteDef(
      Routes.transactionHistoryScreenView,
      page: _i17.TransactionHistoryScreenView,
    ),
    _i1.RouteDef(
      Routes.kycidcardbackView,
      page: _i18.KycidcardbackView,
    ),
    _i1.RouteDef(
      Routes.kycbankaccountView,
      page: _i19.KycbankaccountView,
    ),
    _i1.RouteDef(
      Routes.kycprofileView,
      page: _i20.KycprofileView,
    ),
    _i1.RouteDef(
      Routes.kycpassportView,
      page: _i21.KycpassportView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.SignupView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignupView(),
        settings: data,
      );
    },
    _i6.CreateanaccountView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CreateanaccountView(),
        settings: data,
      );
    },
    _i7.DashboardScreenView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DashboardScreenView(),
        settings: data,
      );
    },
    _i8.ForgetpasswordView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ForgetpasswordView(),
        settings: data,
      );
    },
    _i9.OtpverificationView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.OtpverificationView(),
        settings: data,
      );
    },
    _i10.ReceiveotpverificationView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ReceiveotpverificationView(),
        settings: data,
      );
    },
    _i11.ChangepasswordView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ChangepasswordView(),
        settings: data,
      );
    },
    _i12.KycView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.KycView(),
        settings: data,
      );
    },
    _i13.StatisticView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.StatisticView(),
        settings: data,
      );
    },
    _i14.BuygoldorsilverView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.BuygoldorsilverView(),
        settings: data,
      );
    },
    _i15.KycidcardfrontView: (data) {
      final args = data.getArgs<KycidcardfrontViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.KycidcardfrontView(
            key: args.key,
            cnicController: args.cnicController,
            onClickNext: args.onClickNext,
            onClickUpload: args.onClickUpload,
            formKey: args.formKey),
        settings: data,
      );
    },
    _i16.NotificationScreenView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.NotificationScreenView(),
        settings: data,
      );
    },
    _i17.TransactionHistoryScreenView: (data) {
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.TransactionHistoryScreenView(),
        settings: data,
      );
    },
    _i18.KycidcardbackView: (data) {
      final args = data.getArgs<KycidcardbackViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.KycidcardbackView(
            key: args.key,
            onCnicBack: args.onCnicBack,
            onChangedCheckbox: args.onChangedCheckbox,
            concent: args.concent,
            onClickNext: args.onClickNext),
        settings: data,
      );
    },
    _i19.KycbankaccountView: (data) {
      final args = data.getArgs<KycbankaccountViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.KycbankaccountView(
            key: args.key,
            accountNoController: args.accountNoController,
            confirmNoController: args.confirmNoController,
            onClickNext: args.onClickNext,
            bankNameController: args.bankNameController,
            ifscCodeController: args.ifscCodeController,
            formkey: args.formkey),
        settings: data,
      );
    },
    _i20.KycprofileView: (data) {
      final args = data.getArgs<KycprofileViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.KycprofileView(
            key: args.key,
            uploadProfile: args.uploadProfile,
            dobController: args.dobController,
            sumbitKyc: args.sumbitKyc,
            formkey: args.formkey),
        settings: data,
      );
    },
    _i21.KycpassportView: (data) {
      final args = data.getArgs<KycpassportViewArguments>(nullOk: false);
      return _i22.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.KycpassportView(
            key: args.key,
            passportNoController: args.passportNoController,
            onClickNext: args.onClickNext,
            formkey: args.formkey),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class KycidcardfrontViewArguments {
  const KycidcardfrontViewArguments({
    this.key,
    required this.cnicController,
    required this.onClickNext,
    required this.onClickUpload,
    required this.formKey,
  });

  final _i22.Key? key;

  final _i22.TextEditingController cnicController;

  final void Function() onClickNext;

  final void Function() onClickUpload;

  final _i22.GlobalKey<_i22.FormState> formKey;

  @override
  String toString() {
    return '{"key": "$key", "cnicController": "$cnicController", "onClickNext": "$onClickNext", "onClickUpload": "$onClickUpload", "formKey": "$formKey"}';
  }

  @override
  bool operator ==(covariant KycidcardfrontViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.cnicController == cnicController &&
        other.onClickNext == onClickNext &&
        other.onClickUpload == onClickUpload &&
        other.formKey == formKey;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        cnicController.hashCode ^
        onClickNext.hashCode ^
        onClickUpload.hashCode ^
        formKey.hashCode;
  }
}

class KycidcardbackViewArguments {
  const KycidcardbackViewArguments({
    this.key,
    required this.onCnicBack,
    required this.onChangedCheckbox,
    required this.concent,
    required this.onClickNext,
  });

  final _i22.Key? key;

  final void Function() onCnicBack;

  final void Function(bool?) onChangedCheckbox;

  final bool concent;

  final void Function() onClickNext;

  @override
  String toString() {
    return '{"key": "$key", "onCnicBack": "$onCnicBack", "onChangedCheckbox": "$onChangedCheckbox", "concent": "$concent", "onClickNext": "$onClickNext"}';
  }

  @override
  bool operator ==(covariant KycidcardbackViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.onCnicBack == onCnicBack &&
        other.onChangedCheckbox == onChangedCheckbox &&
        other.concent == concent &&
        other.onClickNext == onClickNext;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        onCnicBack.hashCode ^
        onChangedCheckbox.hashCode ^
        concent.hashCode ^
        onClickNext.hashCode;
  }
}

class KycbankaccountViewArguments {
  const KycbankaccountViewArguments({
    this.key,
    required this.accountNoController,
    required this.confirmNoController,
    required this.onClickNext,
    required this.bankNameController,
    required this.ifscCodeController,
    required this.formkey,
  });

  final _i22.Key? key;

  final _i22.TextEditingController accountNoController;

  final _i22.TextEditingController confirmNoController;

  final void Function() onClickNext;

  final _i22.TextEditingController bankNameController;

  final _i22.TextEditingController ifscCodeController;

  final _i22.GlobalKey<_i22.FormState> formkey;

  @override
  String toString() {
    return '{"key": "$key", "accountNoController": "$accountNoController", "confirmNoController": "$confirmNoController", "onClickNext": "$onClickNext", "bankNameController": "$bankNameController", "ifscCodeController": "$ifscCodeController", "formkey": "$formkey"}';
  }

  @override
  bool operator ==(covariant KycbankaccountViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.accountNoController == accountNoController &&
        other.confirmNoController == confirmNoController &&
        other.onClickNext == onClickNext &&
        other.bankNameController == bankNameController &&
        other.ifscCodeController == ifscCodeController &&
        other.formkey == formkey;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        accountNoController.hashCode ^
        confirmNoController.hashCode ^
        onClickNext.hashCode ^
        bankNameController.hashCode ^
        ifscCodeController.hashCode ^
        formkey.hashCode;
  }
}

class KycprofileViewArguments {
  const KycprofileViewArguments({
    this.key,
    required this.uploadProfile,
    required this.dobController,
    required this.sumbitKyc,
    required this.formkey,
  });

  final _i22.Key? key;

  final void Function() uploadProfile;

  final _i22.TextEditingController dobController;

  final void Function() sumbitKyc;

  final _i22.GlobalKey<_i22.FormState> formkey;

  @override
  String toString() {
    return '{"key": "$key", "uploadProfile": "$uploadProfile", "dobController": "$dobController", "sumbitKyc": "$sumbitKyc", "formkey": "$formkey"}';
  }

  @override
  bool operator ==(covariant KycprofileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.uploadProfile == uploadProfile &&
        other.dobController == dobController &&
        other.sumbitKyc == sumbitKyc &&
        other.formkey == formkey;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        uploadProfile.hashCode ^
        dobController.hashCode ^
        sumbitKyc.hashCode ^
        formkey.hashCode;
  }
}

class KycpassportViewArguments {
  const KycpassportViewArguments({
    this.key,
    required this.passportNoController,
    required this.onClickNext,
    required this.formkey,
  });

  final _i22.Key? key;

  final _i22.TextEditingController passportNoController;

  final void Function() onClickNext;

  final _i22.GlobalKey<_i22.FormState> formkey;

  @override
  String toString() {
    return '{"key": "$key", "passportNoController": "$passportNoController", "onClickNext": "$onClickNext", "formkey": "$formkey"}';
  }

  @override
  bool operator ==(covariant KycpassportViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.passportNoController == passportNoController &&
        other.onClickNext == onClickNext &&
        other.formkey == formkey;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        passportNoController.hashCode ^
        onClickNext.hashCode ^
        formkey.hashCode;
  }
}

extension NavigatorStateExtension on _i23.NavigationService {
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

  Future<dynamic> navigateToBuygoldorsilverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.buygoldorsilverView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycidcardfrontView({
    _i22.Key? key,
    required _i22.TextEditingController cnicController,
    required void Function() onClickNext,
    required void Function() onClickUpload,
    required _i22.GlobalKey<_i22.FormState> formKey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.kycidcardfrontView,
        arguments: KycidcardfrontViewArguments(
            key: key,
            cnicController: cnicController,
            onClickNext: onClickNext,
            onClickUpload: onClickUpload,
            formKey: formKey),
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

  Future<dynamic> navigateToTransactionHistoryScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.transactionHistoryScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycidcardbackView({
    _i22.Key? key,
    required void Function() onCnicBack,
    required void Function(bool?) onChangedCheckbox,
    required bool concent,
    required void Function() onClickNext,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.kycidcardbackView,
        arguments: KycidcardbackViewArguments(
            key: key,
            onCnicBack: onCnicBack,
            onChangedCheckbox: onChangedCheckbox,
            concent: concent,
            onClickNext: onClickNext),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycbankaccountView({
    _i22.Key? key,
    required _i22.TextEditingController accountNoController,
    required _i22.TextEditingController confirmNoController,
    required void Function() onClickNext,
    required _i22.TextEditingController bankNameController,
    required _i22.TextEditingController ifscCodeController,
    required _i22.GlobalKey<_i22.FormState> formkey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.kycbankaccountView,
        arguments: KycbankaccountViewArguments(
            key: key,
            accountNoController: accountNoController,
            confirmNoController: confirmNoController,
            onClickNext: onClickNext,
            bankNameController: bankNameController,
            ifscCodeController: ifscCodeController,
            formkey: formkey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycprofileView({
    _i22.Key? key,
    required void Function() uploadProfile,
    required _i22.TextEditingController dobController,
    required void Function() sumbitKyc,
    required _i22.GlobalKey<_i22.FormState> formkey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.kycprofileView,
        arguments: KycprofileViewArguments(
            key: key,
            uploadProfile: uploadProfile,
            dobController: dobController,
            sumbitKyc: sumbitKyc,
            formkey: formkey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycpassportView({
    _i22.Key? key,
    required _i22.TextEditingController passportNoController,
    required void Function() onClickNext,
    required _i22.GlobalKey<_i22.FormState> formkey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.kycpassportView,
        arguments: KycpassportViewArguments(
            key: key,
            passportNoController: passportNoController,
            onClickNext: onClickNext,
            formkey: formkey),
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

  Future<dynamic> replaceWithBuygoldorsilverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.buygoldorsilverView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycidcardfrontView({
    _i22.Key? key,
    required _i22.TextEditingController cnicController,
    required void Function() onClickNext,
    required void Function() onClickUpload,
    required _i22.GlobalKey<_i22.FormState> formKey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.kycidcardfrontView,
        arguments: KycidcardfrontViewArguments(
            key: key,
            cnicController: cnicController,
            onClickNext: onClickNext,
            onClickUpload: onClickUpload,
            formKey: formKey),
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

  Future<dynamic> replaceWithTransactionHistoryScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.transactionHistoryScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycidcardbackView({
    _i22.Key? key,
    required void Function() onCnicBack,
    required void Function(bool?) onChangedCheckbox,
    required bool concent,
    required void Function() onClickNext,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.kycidcardbackView,
        arguments: KycidcardbackViewArguments(
            key: key,
            onCnicBack: onCnicBack,
            onChangedCheckbox: onChangedCheckbox,
            concent: concent,
            onClickNext: onClickNext),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycbankaccountView({
    _i22.Key? key,
    required _i22.TextEditingController accountNoController,
    required _i22.TextEditingController confirmNoController,
    required void Function() onClickNext,
    required _i22.TextEditingController bankNameController,
    required _i22.TextEditingController ifscCodeController,
    required _i22.GlobalKey<_i22.FormState> formkey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.kycbankaccountView,
        arguments: KycbankaccountViewArguments(
            key: key,
            accountNoController: accountNoController,
            confirmNoController: confirmNoController,
            onClickNext: onClickNext,
            bankNameController: bankNameController,
            ifscCodeController: ifscCodeController,
            formkey: formkey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycprofileView({
    _i22.Key? key,
    required void Function() uploadProfile,
    required _i22.TextEditingController dobController,
    required void Function() sumbitKyc,
    required _i22.GlobalKey<_i22.FormState> formkey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.kycprofileView,
        arguments: KycprofileViewArguments(
            key: key,
            uploadProfile: uploadProfile,
            dobController: dobController,
            sumbitKyc: sumbitKyc,
            formkey: formkey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycpassportView({
    _i22.Key? key,
    required _i22.TextEditingController passportNoController,
    required void Function() onClickNext,
    required _i22.GlobalKey<_i22.FormState> formkey,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.kycpassportView,
        arguments: KycpassportViewArguments(
            key: key,
            passportNoController: passportNoController,
            onClickNext: onClickNext,
            formkey: formkey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
