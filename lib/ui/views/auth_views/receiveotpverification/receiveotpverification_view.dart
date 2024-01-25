import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:stacked/stacked.dart';

import '../../../common/ui_helpers.dart';
import 'receiveotpverification_viewmodel.dart';

class ReceiveotpverificationView
    extends StackedView<ReceiveotpverificationViewModel> {
  const ReceiveotpverificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReceiveotpverificationViewModel viewModel,
   
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              verticalSpaceLarge,
              OTPTextField(
                controller: viewModel.otpController,
                isDense: true,
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 32,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onChanged: (pin) {},
                onCompleted: (pin) {
                  viewModel.pinCode = pin;
                },
              ),
              verticalSpaceMedium,
              Text(
                'Resend OTP in ${viewModel.resendTimeout} seconds',
                style: const TextStyle(fontSize: 16),
              ),
              TextButton(
                onPressed:
                    viewModel.resendTimeout == 0 ? viewModel.resendOtp : null,
                child: const Text('Resend OTP'),
              ),
              verticalSpaceMedium,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      fixedSize: const Size(144, 40)),
                  onPressed: viewModel.onPressedContinue,
                  child: const Text("Continue"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  ReceiveotpverificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReceiveotpverificationViewModel();
  @override
  void onViewModelReady(ReceiveotpverificationViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
