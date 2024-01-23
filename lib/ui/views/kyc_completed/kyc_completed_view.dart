import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kyc_completed_viewmodel.dart';

class KycCompletedView extends StackedView<KycCompletedViewModel> {
  const KycCompletedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycCompletedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            verticalSpaceMassive,
            Center(
              child: Image.asset(
                "assets/images/kyc_completed.png",
                height: 240,
                width: 240,
              ),
            ),
            verticalSpaceMassive,
            Text(
              'Thanks for submitting your document we’ll verify it and complete your KYC as soon as possible.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            verticalSpaceMedium,
            ElevatedButton.icon(
              onPressed: viewModel.onPressedBackToHome,
              style: ElevatedButton.styleFrom(minimumSize: null),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              ),
              label: const Text("Back to Home"),
            )
          ]),
        ),
      ),
    );
  }

  @override
  KycCompletedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycCompletedViewModel();
}
