import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';

import 'forgetpassword_viewmodel.dart';

class ForgetpasswordView extends StackedView<ForgetpasswordViewModel> {
  const ForgetpasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgetpasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 48.0, horizontal: 12.5),
              child: Center(
                  child: Image.asset("assets/images/hrum_remix_silver1.png")),
            ),
            verticalSpaceLarge,
            Text(
              'Forget Password',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'Enter your registered phone number below',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            verticalSpaceLarge,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: viewModel.formKey,
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
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
                    onSaved: (PhoneNumber number) {},
                  ),
                ),
                verticalSpaceMedium,
                RichText(
                  text: TextSpan(
                    text: 'Remember the password? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: const Color(0xffF5B119)),
                          text: 'Sign in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = viewModel.onPressedSubmit),
                    ],
                  ),
                ),
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
  ForgetpasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgetpasswordViewModel();
}
