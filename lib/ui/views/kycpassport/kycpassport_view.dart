import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import 'kycpassport_viewmodel.dart';

class KycpassportView extends StackedView<KycpassportViewModel> {
  const KycpassportView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycpassportViewModel viewModel,
    Widget? child,
  ) {
    return KycLayoutWidget(
        title: 'Passport',
        subtitle:
            'Please enter your Passport Number, and upload your Passport Photo Below.',
        onPressed: () {},
        buttonText: 'Next',
        children: const [
          Form(
              key: null,
              child: KTextFormField(
                controller: null,
                label: '',
                keyboardType: null,
              )),
        ]);
  }

  @override
  KycpassportViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycpassportViewModel();
}
