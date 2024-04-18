import 'dart:async';

import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class ReceiveotpverificationViewModel extends BaseViewModel {
  final OtpFieldController otpController = OtpFieldController();
  final navigationService = locator<NavigationService>();
  String? pinCode;
  bool? isWrongPin;
  final authService = locator<AuthService>();
  int resendTimeout = 30;
  Timer? resendTimer;

  void startResendTimer() {
    resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTimeout > 0) {
        resendTimeout--;
        rebuildUi();
      } else {
        resendTimer?.cancel();
      }
    });
  }

  void resendOtp() {
    resendTimeout = 30;
    startResendTimer();
  }

  void onViewModelReady() async {
    setBusy(true);
    startResendTimer();
    setBusy(false);
  }

  void onPressedContinue(BuildContext context) async {
    print(pinCode);
    bool flag = await authService.signInWithPhoneNumber(pinCode!, context);
    if (flag) {
      navigationService.replaceWithDashboardScreenView();
    } else {
      isWrongPin = flag;
      notifyListeners();
    }
  }
}
