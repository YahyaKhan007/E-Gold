import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import '../../common/ui_helpers.dart';

import 'kycbankaccount_viewmodel.dart';

class KycbankaccountView extends StackedView<KycbankaccountViewModel> {
  const KycbankaccountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycbankaccountViewModel viewModel,
    Widget? child,
  ) {
    return KycLayoutWidget(
        title: 'Bank Account',
        subtitle:
            'Please enter your bank account details with which you are going to make payment for investment.',
        onPressed: () {},
        buttonText: 'Next',
        children: const [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KTextFormField(
                  controller: null,
                  label: 'Account Number',
                  keyboardType: TextInputType.number,
                ),
                KTextFormField(
                  controller: null,
                  label: 'Confirm Account Number',
                  keyboardType: TextInputType.number,
                ),
                KTextFormField(
                  controller: null,
                  label: 'Bank Name',
                  keyboardType: null,
                ),
                KTextFormField(
                  controller: null,
                  label: 'IFSC Code',
                  keyboardType: TextInputType.number,
                ),
                verticalSpaceMedium,
              ],
            ),
          )
        ]);
  }

  @override
  KycbankaccountViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycbankaccountViewModel();
}
