import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/common/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';

import 'phone_sign_up_viewmodel.dart';

class PhoneSignUpView extends StackedView<PhoneSignUpViewModel> {
  const PhoneSignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PhoneSignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceSmall,
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 48.0, horizontal: 12.5),
              child: Center(
                  child: Image.asset("assets/images/hrum_remix_silver1.png")),
            ),
            verticalSpaceLarge,
            Text(
              'Phone SignUp',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'Enter your phone number below',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            verticalSpaceLarge,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: viewModel.formKey,
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                      viewModel.phoneNumber = number.phoneNumber!;
                      print('check this out ${viewModel.phoneNumber}');
                    },
                    onInputValidated: (bool value) {},
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      useBottomSheetSafeArea: true,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: viewModel.number,
                    textFieldController: viewModel.phoneController,
                    formatInput: true,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputBorder: const OutlineInputBorder(),
                    onSaved: (PhoneNumber number) {
                      viewModel.phoneNumber = number.toString();
                    },
                  ),
                ),
                verticalSpaceSmall,
                verticalSpaceLarge,
                ElevatedButton(
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              fixedSize: MaterialStateProperty.resolveWith(
                                  (states) => const Size.fromHeight(48)),
                            ),
                    onPressed: viewModel.onPressedSubmit,
                    child: const Text('Submit'))
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  PhoneSignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PhoneSignUpViewModel();
}
