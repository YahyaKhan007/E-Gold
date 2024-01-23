import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import 'kycpassport_viewmodel.dart';

class KycpassportView extends StackedView<KycpassportViewModel> {
  TextEditingController passportNoController = TextEditingController();
  VoidCallback onClickNext;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  KycpassportView(
      {Key? key,
      required this.passportNoController,
      required this.onClickNext,
      required this.formkey})
      : super(key: key);

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
        onPressed: onClickNext,
        buttonText: 'Next',
        children: [
          Form(
              key: formkey,
              child: KTextFormField(
                controller: passportNoController,
                label: "Passport Number",
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
