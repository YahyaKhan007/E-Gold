import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../common/ui_helpers.dart';
import 'createanaccount_viewmodel.dart';

class CreateanaccountView extends StackedView<CreateanaccountViewModel> {
  const CreateanaccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateanaccountViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
                child: Text(
              'Create an account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )),
            verticalSpaceTiny,
            const Text(
              'Create an account you can explore\nall the existing jobs',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            verticalSpaceLarge,
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(48),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () => viewModel.handleButtonPress(index),
                      icon: Icon(
                        viewModel.buttonData[index]['icon'],
                        size: 28.0,
                      ),
                      label: Text(viewModel.buttonData[index]['text']),
                    ),
                  ),
                )),
            verticalSpaceSmall,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: const Color(0xffF5B119)),
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = viewModel.onButtonPressed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CreateanaccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateanaccountViewModel();
}
