import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kyc_approved_viewmodel.dart';

class KycApprovedView extends StackedView<KycApprovedViewModel> {
  bool isApproved;
  KycApprovedView({Key? key, required this.isApproved}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycApprovedViewModel viewModel,
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
            isApproved
                ? Text(
                    'Congratulations your documents has been approved',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(
                    'You documents has been submitted but not approved, we wil get back to you soon',
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
  KycApprovedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycApprovedViewModel();
}
