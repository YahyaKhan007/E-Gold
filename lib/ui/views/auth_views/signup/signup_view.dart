import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:stacked/stacked.dart';

import '../../../common/ui_helpers.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                  child: Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
              verticalSpaceTiny,
              const Text(
                'Create an account you can explore all the existing jobs',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              verticalSpaceLarge,
              Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InternationalPhoneNumberInput(
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
                      onSaved: (PhoneNumber number) {},
                    ),
                    verticalSpaceSmall,
                    TextFormField(
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                          ),
                        ),
                        validator: viewModel.signUpEmailValidator),
                    verticalSpaceSmall,
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.isPasswordVisible,
                      validator: viewModel.signUpPasswordValidator,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: viewModel.showPassword,
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    TextFormField(
                      controller: viewModel.conformPasswordController,
                      obscureText: viewModel.isConformPasswordVisible,
                      validator: viewModel.signUpConfirmPasswordValidator,
                      decoration: InputDecoration(
                        label: const Text('Conform Password'),
                        suffixIcon: IconButton(
                            icon: Icon(
                              viewModel.isConformPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: viewModel.showConfirmPassword),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: viewModel.onPressedSignup,
                      child: const Text('Sign up')),
                  verticalSpaceMedium,
                  TextButton(
                      onPressed: viewModel.onPressedAlreadyHaveAnAccount,
                      child: const Text('Already have an account?')),
                ],
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
