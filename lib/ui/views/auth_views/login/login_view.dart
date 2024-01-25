import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
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
    var styleFrom = ElevatedButton.styleFrom(
      minimumSize: const Size(48, 48),
      padding: const EdgeInsets.all(4),
      backgroundColor: Colors.black,
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
                child: Text(
              'Login here',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )),
            verticalSpaceTiny,
            const Text(
              'Welcome back you\'ve\nbeen missed!.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            verticalSpaceLarge,
            Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                      controller: viewModel.emailController,
                      decoration: const InputDecoration(
                        label: Text(
                          'Email or Phone Number',
                        ),
                      ),
                      validator: viewModel.signInEmailValidator),
                  verticalSpaceMedium,
                  TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: viewModel.isPasswordVisible,
                    validator: viewModel.signInPasswordValidator,
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
                          .copyWith(color: const Color(0xffF5B119)),
                      text: 'Change',
                      recognizer: TapGestureRecognizer()
                        ..onTap = viewModel
                            .navigationService.navigateToForgetpasswordView),
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
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: viewModel.onPressedCreateNewAccount,
                    child: const Text('Create new account')),
              ],
            ),
            verticalSpaceMedium,
            const Text(
              'Or continue ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 0),
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
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
