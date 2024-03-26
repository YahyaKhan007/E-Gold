import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/common/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    var styleFrom = ElevatedButton.styleFrom(
      minimumSize: const Size(48, 48),
      padding: const EdgeInsets.all(4),
      backgroundColor: kcButtonBackground,
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Login here',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
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
            top: size.height * 0.18,
            child: Container(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    verticalSpaceTiny,
                    const Text(
                      'Welcome back you\'ve\nbeen missed!.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    verticalSpaceLarge,
                    Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              controller: viewModel.emailController,
                              decoration: const InputDecoration(
                                label: Text(
                                  'Email or Phone Number',
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              validator: Validator.validateEmail),
                          verticalSpaceMedium,
                          TextFormField(
                            controller: viewModel.passwordController,
                            obscureText: viewModel.isPasswordVisible,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            validator: Validator.validatePassword,
                            decoration: InputDecoration(
                              // fillColor: Colors.transparent,
                              label: const Text('Password'),
                              labelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  viewModel.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: viewModel.showPassword,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        text: 'Forget password? ',
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                              text: 'Change',
                              recognizer: TapGestureRecognizer()
                                ..onTap = viewModel.navigationService
                                    .navigateToForgetpasswordView),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: viewModel.onPressedLogin,
                            child: const Text('Sign in')),
                        verticalSpaceMedium,
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1D80C9),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: viewModel.onPressedCreateNewAccount,
                            child: const Text('Create new account')),
                      ],
                    ),
                    verticalSpaceMedium,
                    const Text(
                      'Or continue ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 72, vertical: 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int i = 0; i < 3; i++)
                            ElevatedButton(
                              onPressed: () => viewModel.handleButtonPress(i),
                              style: styleFrom,
                              child: Icon(
                                viewModel.iconData[i],
                                size: 28.0,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
