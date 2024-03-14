import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/common/validator.dart';
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFB3E5FC), // Light blue
                Color(0xFFE1F5FE), // Lighter blue
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceLarge,
              Text(
                'Forget Password',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w600, color: kcTextColor),
              ),
              Text(
                'Enter your registered phone number below',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: kcTextColor),
              ),
              verticalSpaceLarge,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: viewModel.formKey,
                    child: TextFormField(
                        style: const TextStyle(
                          color: Color(0xff000D5E),
                        ),
                        controller: viewModel.emailController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xff000D5E),
                          ),
                        ),
                        validator: Validator.validateEmail),
                  ),
                  verticalSpaceSmall,
                  //   child: InternationalPhoneNumberInput(
                  //     onInputChanged: (PhoneNumber number) {},
                  //     onInputValidated: (bool value) {},
                  //     selectorConfig: const SelectorConfig(
                  //       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  //       useBottomSheetSafeArea: true,
                  //     ),
                  //     ignoreBlank: false,
                  //     autoValidateMode: AutovalidateMode.disabled,
                  //     selectorTextStyle: const TextStyle(color: Colors.black),
                  //     initialValue: viewModel.number,
                  //     textFieldController: viewModel.phoneController,
                  //     formatInput: true,
                  //     keyboardType: const TextInputType.numberWithOptions(
                  //         signed: true, decimal: true),
                  //     inputBorder: const OutlineInputBorder(),
                  //     onSaved: (PhoneNumber number) {},
                  //   ),
                  // ),

                  GestureDetector(
                    onTap: viewModel.onTapSignIn,
                    child: RichText(
                      text: TextSpan(
                        text: 'Remember the password? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: kcTextColor),
                              text: 'Sign in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = viewModel.onPressedSubmit),
                        ],
                      ),
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
      ),
    );
  }

  @override
  ForgetpasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgetpasswordViewModel();
}
