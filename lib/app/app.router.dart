// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_gold/ui/views/account_screen/account_screen_view.dart'
    as _i16;
import 'package:e_gold/ui/views/add_crypto_screen/add_crypto_screen_view.dart'
    as _i27;
import 'package:e_gold/ui/views/add_new_card_payment_screen/add_new_card_payment_screen_view.dart'
    as _i26;
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
    as _i13;
import 'package:e_gold/ui/views/card_payment_screen/card_payment_screen_view.dart'
    as _i25;
import 'package:e_gold/ui/views/change_password/change_password_view.dart'
    as _i32;
import 'package:e_gold/ui/views/crypto_payment_screen/crypto_payment_screen_view.dart'
    as _i24;
import 'package:e_gold/ui/views/dashboard_screen/dashboard_screen_view.dart'
    as _i7;
import 'package:e_gold/ui/views/deposit_screen/deposit_screen_view.dart'
    as _i22;
import 'package:e_gold/ui/views/edit_profile/edit_profile_view.dart' as _i31;
import 'package:e_gold/ui/views/goldbalancehistory/goldbalancehistory_view.dart'
    as _i34;
import 'package:e_gold/ui/views/home/home_view.dart' as _i2;
import 'package:e_gold/ui/views/in_store_payment_screen/in_store_payment_screen_view.dart'
    as _i23;
import 'package:e_gold/ui/views/kyc/kyc_view.dart' as _i12;
import 'package:e_gold/ui/views/kyc_approved/kyc_approved_view.dart' as _i30;
import 'package:e_gold/ui/views/kyc_completed/kyc_completed_view.dart' as _i29;
import 'package:e_gold/ui/views/kycbankaccount/kycbankaccount_view.dart'
    as _i19;
import 'package:e_gold/ui/views/kycidcardback/kycidcardback_view.dart' as _i18;
import 'package:e_gold/ui/views/kycidcardfront/kycidcardfront_view.dart'
    as _i17;
import 'package:e_gold/ui/views/kycpassport/kycpassport_view.dart' as _i21;
import 'package:e_gold/ui/views/kycprofile/kycprofile_view.dart' as _i20;
import 'package:e_gold/ui/views/notification_screen/notification_screen_view.dart'
    as _i15;
import 'package:e_gold/ui/views/sliverbalancehistory/sliverbalancehistory_view.dart'
    as _i33;
import 'package:e_gold/ui/views/startup/startup_view.dart' as _i3;
import 'package:e_gold/ui/views/statistic/statistic_view.dart' as _i35;
import 'package:e_gold/ui/views/transaction_history_screen/transaction_history_screen_view.dart'
    as _i14;
import 'package:e_gold/ui/views/transaction_screen/transaction_screen_view.dart'
    as _i28;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i36;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i37;

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

  static const buyGoldOrSilverView = '/buy-gold-or-silver-view';

  static const transactionHistoryScreenView =
      '/transaction-history-screen-view';

  static const notificationScreenView = '/notification-screen-view';

  static const accountScreenView = '/account-screen-view';

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

  static const addCryptoScreenView = '/add-crypto-screen-view';

  static const transactionScreenView = '/transaction-screen-view';

  static const kycCompletedView = '/kyc-completed-view';

  static const kycApprovedView = '/kyc-approved-view';

  static const editProfileView = '/edit-profile-view';

  static const changePasswordView = '/change-password-view';

  static const sliverbalancehistoryView = '/sliverbalancehistory-view';

  static const goldbalancehistoryView = '/goldbalancehistory-view';

  static const statisticView = '/statistic-view';

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
    buyGoldOrSilverView,
    transactionHistoryScreenView,
    notificationScreenView,
    accountScreenView,
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
    addCryptoScreenView,
    transactionScreenView,
    kycCompletedView,
    kycApprovedView,
    editProfileView,
    changePasswordView,
    sliverbalancehistoryView,
    goldbalancehistoryView,
    statisticView,
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
      Routes.buyGoldOrSilverView,
      page: _i13.BuyGoldOrSilverView,
    ),
    _i1.RouteDef(
      Routes.transactionHistoryScreenView,
      page: _i14.TransactionHistoryScreenView,
    ),
    _i1.RouteDef(
      Routes.notificationScreenView,
      page: _i15.NotificationScreenView,
    ),
    _i1.RouteDef(
      Routes.accountScreenView,
      page: _i16.AccountScreenView,
    ),
    _i1.RouteDef(
      Routes.kycidcardfrontView,
      page: _i17.KycidcardfrontView,
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
    _i1.RouteDef(
      Routes.depositScreenView,
      page: _i22.DepositScreenView,
    ),
    _i1.RouteDef(
      Routes.inStorePaymentScreenView,
      page: _i23.InStorePaymentScreenView,
    ),
    _i1.RouteDef(
      Routes.cryptoPaymentScreenView,
      page: _i24.CryptoPaymentScreenView,
    ),
    _i1.RouteDef(
      Routes.cardPaymentScreenView,
      page: _i25.CardPaymentScreenView,
    ),
    _i1.RouteDef(
      Routes.addNewCardPaymentScreenView,
      page: _i26.AddNewCardPaymentScreenView,
    ),
    _i1.RouteDef(
      Routes.addCryptoScreenView,
      page: _i27.AddCryptoScreenView,
    ),
    _i1.RouteDef(
      Routes.transactionScreenView,
      page: _i28.TransactionScreenView,
    ),
    _i1.RouteDef(
      Routes.kycCompletedView,
      page: _i29.KycCompletedView,
    ),
    _i1.RouteDef(
      Routes.kycApprovedView,
      page: _i30.KycApprovedView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i31.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i32.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.sliverbalancehistoryView,
      page: _i33.SliverbalancehistoryView,
    ),
    _i1.RouteDef(
      Routes.goldbalancehistoryView,
      page: _i34.GoldbalancehistoryView,
    ),
    _i1.RouteDef(
      Routes.statisticView,
      page: _i35.StatisticView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.SignupView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SignupView(),
        settings: data,
      );
    },
    _i6.CreateanaccountView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.CreateanaccountView(),
        settings: data,
      );
    },
    _i7.DashboardScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DashboardScreenView(),
        settings: data,
      );
    },
    _i8.ForgetpasswordView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ForgetpasswordView(),
        settings: data,
      );
    },
    _i9.OtpverificationView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.OtpverificationView(),
        settings: data,
      );
    },
    _i10.ReceiveotpverificationView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ReceiveotpverificationView(),
        settings: data,
      );
    },
    _i11.ChangepasswordView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ChangepasswordView(),
        settings: data,
      );
    },
    _i12.KycView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.KycView(),
        settings: data,
      );
    },
    _i13.BuyGoldOrSilverView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.BuyGoldOrSilverView(),
        settings: data,
      );
    },
    _i14.TransactionHistoryScreenView: (data) {
      final args =
          data.getArgs<TransactionHistoryScreenViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.TransactionHistoryScreenView(key: args.key, check: args.check),
        settings: data,
      );
    },
    _i15.NotificationScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.NotificationScreenView(),
        settings: data,
      );
    },
    _i16.AccountScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.AccountScreenView(),
        settings: data,
      );
    },
    _i17.KycidcardfrontView: (data) {
      final args = data.getArgs<KycidcardfrontViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.KycidcardfrontView(
            key: args.key,
            cnicController: args.cnicController,
            onClickNext: args.onClickNext,
            onClickUpload: args.onClickUpload,
            idFrontUploaded: args.idFrontUploaded,
            formKey: args.formKey),
        settings: data,
      );
    },
    _i18.KycidcardbackView: (data) {
      final args = data.getArgs<KycidcardbackViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.KycidcardbackView(
            key: args.key,
            idBackUploaded: args.idBackUploaded,
            onCnicBack: args.onCnicBack,
            onChangedCheckbox: args.onChangedCheckbox,
            concent: args.concent,
            onClickNext: args.onClickNext),
        settings: data,
      );
    },
    _i19.KycbankaccountView: (data) {
      final args = data.getArgs<KycbankaccountViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
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
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.KycprofileView(
            key: args.key,
            uploadProfile: args.uploadProfile,
            onTapDOB: args.onTapDOB,
            dobController: args.dobController,
            profileImgupLoaded: args.profileImgupLoaded,
            sumbitKyc: args.sumbitKyc,
            formkey: args.formkey),
        settings: data,
      );
    },
    _i21.KycpassportView: (data) {
      final args = data.getArgs<KycpassportViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.KycpassportView(
            key: args.key,
            passportNoController: args.passportNoController,
            onClickNext: args.onClickNext,
            formkey: args.formkey),
        settings: data,
      );
    },
    _i22.DepositScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.DepositScreenView(),
        settings: data,
      );
    },
    _i23.InStorePaymentScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.InStorePaymentScreenView(),
        settings: data,
      );
    },
    _i24.CryptoPaymentScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.CryptoPaymentScreenView(),
        settings: data,
      );
    },
    _i25.CardPaymentScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.CardPaymentScreenView(),
        settings: data,
      );
    },
    _i26.AddNewCardPaymentScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.AddNewCardPaymentScreenView(),
        settings: data,
      );
    },
    _i27.AddCryptoScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.AddCryptoScreenView(),
        settings: data,
      );
    },
    _i28.TransactionScreenView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.TransactionScreenView(),
        settings: data,
      );
    },
    _i29.KycCompletedView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i29.KycCompletedView(),
        settings: data,
      );
    },
    _i30.KycApprovedView: (data) {
      final args = data.getArgs<KycApprovedViewArguments>(nullOk: false);
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i30.KycApprovedView(key: args.key, isApproved: args.isApproved),
        settings: data,
      );
    },
    _i31.EditProfileView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i31.EditProfileView(),
        settings: data,
      );
    },
    _i32.ChangePasswordView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.ChangePasswordView(),
        settings: data,
      );
    },
    _i33.SliverbalancehistoryView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i33.SliverbalancehistoryView(),
        settings: data,
      );
    },
    _i34.GoldbalancehistoryView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i34.GoldbalancehistoryView(),
        settings: data,
      );
    },
    _i35.StatisticView: (data) {
      return _i36.MaterialPageRoute<dynamic>(
        builder: (context) => const _i35.StatisticView(),
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

  final _i36.Key? key;

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

class KycidcardfrontViewArguments {
  const KycidcardfrontViewArguments({
    this.key,
    required this.cnicController,
    required this.onClickNext,
    required this.onClickUpload,
    required this.idFrontUploaded,
    required this.formKey,
  });

  final _i36.Key? key;

  final _i36.TextEditingController cnicController;

  final void Function() onClickNext;

  final void Function() onClickUpload;

  final bool idFrontUploaded;

  final _i36.GlobalKey<_i36.FormState> formKey;

  @override
  String toString() {
    return '{"key": "$key", "cnicController": "$cnicController", "onClickNext": "$onClickNext", "onClickUpload": "$onClickUpload", "idFrontUploaded": "$idFrontUploaded", "formKey": "$formKey"}';
  }

  @override
  bool operator ==(covariant KycidcardfrontViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.cnicController == cnicController &&
        other.onClickNext == onClickNext &&
        other.onClickUpload == onClickUpload &&
        other.idFrontUploaded == idFrontUploaded &&
        other.formKey == formKey;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        cnicController.hashCode ^
        onClickNext.hashCode ^
        onClickUpload.hashCode ^
        idFrontUploaded.hashCode ^
        formKey.hashCode;
  }
}

class KycidcardbackViewArguments {
  const KycidcardbackViewArguments({
    this.key,
    required this.idBackUploaded,
    required this.onCnicBack,
    required this.onChangedCheckbox,
    required this.concent,
    required this.onClickNext,
  });

  final _i36.Key? key;

  final bool idBackUploaded;

  final void Function() onCnicBack;

  final void Function(bool?) onChangedCheckbox;

  final bool concent;

  final void Function() onClickNext;

  @override
  String toString() {
    return '{"key": "$key", "idBackUploaded": "$idBackUploaded", "onCnicBack": "$onCnicBack", "onChangedCheckbox": "$onChangedCheckbox", "concent": "$concent", "onClickNext": "$onClickNext"}';
  }

  @override
  bool operator ==(covariant KycidcardbackViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.idBackUploaded == idBackUploaded &&
        other.onCnicBack == onCnicBack &&
        other.onChangedCheckbox == onChangedCheckbox &&
        other.concent == concent &&
        other.onClickNext == onClickNext;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        idBackUploaded.hashCode ^
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

  final _i36.Key? key;

  final _i36.TextEditingController accountNoController;

  final _i36.TextEditingController confirmNoController;

  final void Function() onClickNext;

  final _i36.TextEditingController bankNameController;

  final _i36.TextEditingController ifscCodeController;

  final _i36.GlobalKey<_i36.FormState> formkey;

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
    required this.onTapDOB,
    required this.dobController,
    required this.profileImgupLoaded,
    required this.sumbitKyc,
    required this.formkey,
  });

  final _i36.Key? key;

  final void Function() uploadProfile;

  final void Function() onTapDOB;

  final _i36.TextEditingController dobController;

  final bool profileImgupLoaded;

  final void Function() sumbitKyc;

  final _i36.GlobalKey<_i36.FormState> formkey;

  @override
  String toString() {
    return '{"key": "$key", "uploadProfile": "$uploadProfile", "onTapDOB": "$onTapDOB", "dobController": "$dobController", "profileImgupLoaded": "$profileImgupLoaded", "sumbitKyc": "$sumbitKyc", "formkey": "$formkey"}';
  }

  @override
  bool operator ==(covariant KycprofileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.uploadProfile == uploadProfile &&
        other.onTapDOB == onTapDOB &&
        other.dobController == dobController &&
        other.profileImgupLoaded == profileImgupLoaded &&
        other.sumbitKyc == sumbitKyc &&
        other.formkey == formkey;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        uploadProfile.hashCode ^
        onTapDOB.hashCode ^
        dobController.hashCode ^
        profileImgupLoaded.hashCode ^
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

  final _i36.Key? key;

  final _i36.TextEditingController passportNoController;

  final void Function() onClickNext;

  final _i36.GlobalKey<_i36.FormState> formkey;

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

class KycApprovedViewArguments {
  const KycApprovedViewArguments({
    this.key,
    required this.isApproved,
  });

  final _i36.Key? key;

  final bool isApproved;

  @override
  String toString() {
    return '{"key": "$key", "isApproved": "$isApproved"}';
  }

  @override
  bool operator ==(covariant KycApprovedViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isApproved == isApproved;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isApproved.hashCode;
  }
}

extension NavigatorStateExtension on _i37.NavigationService {
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

  Future<dynamic> navigateToTransactionHistoryScreenView({
    _i36.Key? key,
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

  Future<dynamic> navigateToKycidcardfrontView({
    _i36.Key? key,
    required _i36.TextEditingController cnicController,
    required void Function() onClickNext,
    required void Function() onClickUpload,
    required bool idFrontUploaded,
    required _i36.GlobalKey<_i36.FormState> formKey,
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
            idFrontUploaded: idFrontUploaded,
            formKey: formKey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycidcardbackView({
    _i36.Key? key,
    required bool idBackUploaded,
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
            idBackUploaded: idBackUploaded,
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
    _i36.Key? key,
    required _i36.TextEditingController accountNoController,
    required _i36.TextEditingController confirmNoController,
    required void Function() onClickNext,
    required _i36.TextEditingController bankNameController,
    required _i36.TextEditingController ifscCodeController,
    required _i36.GlobalKey<_i36.FormState> formkey,
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
    _i36.Key? key,
    required void Function() uploadProfile,
    required void Function() onTapDOB,
    required _i36.TextEditingController dobController,
    required bool profileImgupLoaded,
    required void Function() sumbitKyc,
    required _i36.GlobalKey<_i36.FormState> formkey,
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
            onTapDOB: onTapDOB,
            dobController: dobController,
            profileImgupLoaded: profileImgupLoaded,
            sumbitKyc: sumbitKyc,
            formkey: formkey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycpassportView({
    _i36.Key? key,
    required _i36.TextEditingController passportNoController,
    required void Function() onClickNext,
    required _i36.GlobalKey<_i36.FormState> formkey,
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

  Future<dynamic> navigateToAddCryptoScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addCryptoScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.transactionScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycCompletedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kycCompletedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKycApprovedView({
    _i36.Key? key,
    required bool isApproved,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.kycApprovedView,
        arguments: KycApprovedViewArguments(key: key, isApproved: isApproved),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSliverbalancehistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sliverbalancehistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGoldbalancehistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.goldbalancehistoryView,
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

  Future<dynamic> replaceWithTransactionHistoryScreenView({
    _i36.Key? key,
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

  Future<dynamic> replaceWithKycidcardfrontView({
    _i36.Key? key,
    required _i36.TextEditingController cnicController,
    required void Function() onClickNext,
    required void Function() onClickUpload,
    required bool idFrontUploaded,
    required _i36.GlobalKey<_i36.FormState> formKey,
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
            idFrontUploaded: idFrontUploaded,
            formKey: formKey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycidcardbackView({
    _i36.Key? key,
    required bool idBackUploaded,
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
            idBackUploaded: idBackUploaded,
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
    _i36.Key? key,
    required _i36.TextEditingController accountNoController,
    required _i36.TextEditingController confirmNoController,
    required void Function() onClickNext,
    required _i36.TextEditingController bankNameController,
    required _i36.TextEditingController ifscCodeController,
    required _i36.GlobalKey<_i36.FormState> formkey,
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
    _i36.Key? key,
    required void Function() uploadProfile,
    required void Function() onTapDOB,
    required _i36.TextEditingController dobController,
    required bool profileImgupLoaded,
    required void Function() sumbitKyc,
    required _i36.GlobalKey<_i36.FormState> formkey,
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
            onTapDOB: onTapDOB,
            dobController: dobController,
            profileImgupLoaded: profileImgupLoaded,
            sumbitKyc: sumbitKyc,
            formkey: formkey),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycpassportView({
    _i36.Key? key,
    required _i36.TextEditingController passportNoController,
    required void Function() onClickNext,
    required _i36.GlobalKey<_i36.FormState> formkey,
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

  Future<dynamic> replaceWithAddCryptoScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addCryptoScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.transactionScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycCompletedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.kycCompletedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKycApprovedView({
    _i36.Key? key,
    required bool isApproved,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.kycApprovedView,
        arguments: KycApprovedViewArguments(key: key, isApproved: isApproved),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSliverbalancehistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sliverbalancehistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGoldbalancehistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.goldbalancehistoryView,
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
}
