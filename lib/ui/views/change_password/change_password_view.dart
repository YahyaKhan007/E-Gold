import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/common/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        appBar: kAppBar(
            context: context,
            onButtonPressed: viewModel.onBack,
            title: const Text(
              'Change Password',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            )),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpaceTiny,
                const Text(
                  'Enter a different password with the previous.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                verticalSpaceLarge,
                Padding(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                  ),
                  child: Form(
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
                          validator: (value) =>
                              Validator.validateConfirmPassword(
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
