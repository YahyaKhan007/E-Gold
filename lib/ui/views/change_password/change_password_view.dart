import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'change_password_viewmodel.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangePasswordViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                    child: Text(
                  'Change New Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                )),
                verticalSpaceTiny,
                const Text(
                  'Enter a different password with the previous.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                verticalSpaceLarge,
                Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      KTextFormField(
                        validator: Validator.validatePassword,
                        controller: viewModel.currentPasswordController,
                        obscureText: viewModel.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: viewModel.showPassword,
                        ),
                        label: 'Old Password',
                        keyboardType: null,
                      ),
                      verticalSpaceMedium,
                      KTextFormField(
                        validator: Validator.validatePassword,
                        controller: viewModel.passwordController,
                        obscureText: viewModel.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: viewModel.showPassword,
                        ),
                        label: 'New Password',
                        keyboardType: null,
                      ),
                      verticalSpaceMedium,
                      KTextFormField(
                        validator: (value) => Validator.validateConfirmPassword(
                          viewModel.passwordController.text,
                          value,
                        ),
                        controller: viewModel.confirmPasswordController,
                        obscureText: viewModel.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: viewModel.showPassword,
                        ),
                        label: 'New Confirm Password',
                        keyboardType: null,
                      ),
                      verticalSpaceLarge,
                      ElevatedButton(
                          onPressed: viewModel.submitForm,
                          child: const Text('Submit'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
