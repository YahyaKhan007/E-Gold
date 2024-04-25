import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/common/validator.dart';
import 'package:flutter/cupertino.dart';
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: viewModel.onBack,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back_home.png'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height * 0.13,
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  color: kcAppBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      verticalSpaceTiny,
                      const Text(
                        'Enter a different password with the previous.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kcTextColor),
                      ),
                      verticalSpaceLarge,
                      Padding(
                        padding: const EdgeInsets.only(
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
                                    color: kcContainerColor,
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
                              Container(
                                decoration: const BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.white,
                                    //     blurRadius: 5,
                                    //     offset: Offset(1, 2),
                                    //     spreadRadius: 0,
                                    //   )
                                    // ],
                                    ),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: kcProfitColor),
                                    onPressed: viewModel.submitForm,
                                    child: const Text('Submit')),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
