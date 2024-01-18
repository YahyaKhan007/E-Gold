import 'package:e_gold/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class ForgetpasswordViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String initialCountry = 'US';

  final navigationService = locator<NavigationService>();
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  final TextEditingController phoneController = TextEditingController();

  void onPressedSubmit() {
    // getPhoneNumber('+15417543010');

    // if (formKey.currentState!.validate()) {
    //   navigationService.replaceWithOtpverificationView();
    // }

    navigationService.replaceWithOtpverificationView();
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    this.number = number;

    rebuildUi();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
