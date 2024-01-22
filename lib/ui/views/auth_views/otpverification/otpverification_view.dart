import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/ui_helpers.dart';
import 'otpverification_viewmodel.dart';

class OtpverificationView extends StackedView<OtpverificationViewModel> {
  const OtpverificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpverificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 48.0, horizontal: 12.5),
              child: Center(
                  child: Image.asset(
                      "assets/images/gold_ingots_gold_svgrepo_com1.png")),
            ),
            verticalSpaceMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Success',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                verticalSpaceTiny,
                const Text(
                  'Please check your Number for OTP to\n set a new password',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            verticalSpaceMedium,
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(),
              onPressed: viewModel.onPressedReceiveOTP,
              child: const Text('Receive OTP'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  OtpverificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpverificationViewModel();
}
