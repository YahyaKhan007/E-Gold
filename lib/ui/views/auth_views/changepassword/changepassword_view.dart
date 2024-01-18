import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/ui_helpers.dart';
import 'changepassword_viewmodel.dart';

class ChangepasswordView extends StackedView<ChangepasswordViewModel> {
  const ChangepasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangepasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: viewModel.isPasswordVisible,
                    decoration: InputDecoration(
                      label: const Text('New Password'),
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
                  verticalSpaceMedium,
                  TextFormField(
                    controller: viewModel.passwordController,
                    obscureText: viewModel.isPasswordVisible,
                    decoration: InputDecoration(
                      label: const Text('Confirm Password'),
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
                  verticalSpaceLarge,
                  ElevatedButton(
                      onPressed: viewModel.onPressedChange,
                      child: const Text('Change'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ChangepasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangepasswordViewModel();
}
