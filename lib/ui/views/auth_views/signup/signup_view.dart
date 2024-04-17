import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/validator.dart';
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              // color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                  child: Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: kcTextColor),
              )),
              verticalSpaceTiny,
              const Text(
                'Create an account you can explore all the existing jobs',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kcTextColor),
              ),
              verticalSpaceLarge,
              Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                        style: const TextStyle(
                          color: Color(0xff000D5E),
                        ),
                        controller: viewModel.nameController,
                        decoration: const InputDecoration(
                          label: Text(
                            'Name',
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xff000D5E),
                          ),
                        ),
                        validator: Validator.validateText),
                    verticalSpaceSmall,
                    TextFormField(
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
                    verticalSpaceSmall,
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xff000D5E),
                      ),
                      controller: viewModel.passwordController,
                      obscureText: viewModel.isPasswordVisible,
                      validator: Validator.validatePassport,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        labelStyle: const TextStyle(
                          color: Color(0xff000D5E),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kcButtonBackground,
                          ),
                          onPressed: viewModel.showPassword,
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    TextFormField(
                      style: const TextStyle(
                        color: Color(0xff000D5E),
                      ),
                      controller: viewModel.conformPasswordController,
                      obscureText: viewModel.isConformPasswordVisible,
                      decoration: InputDecoration(
                        label: const Text('Conform Password'),
                        labelStyle: const TextStyle(
                          color: Color(0xff000D5E),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(
                              viewModel.isConformPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kcButtonBackground,
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
                      onPressed: viewModel.onTapSignUp,
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
