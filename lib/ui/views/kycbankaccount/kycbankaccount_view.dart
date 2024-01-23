import 'package:e_gold/ui/common/validator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import '../../common/ui_helpers.dart';

import 'kycbankaccount_viewmodel.dart';

class KycbankaccountView extends StackedView<KycbankaccountViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController confirmNoController = TextEditingController();
  VoidCallback onClickNext;
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  KycbankaccountView({
    Key? key,
    required this.accountNoController,
    required this.confirmNoController,
    required this.onClickNext,
    required this.bankNameController,
    required this.ifscCodeController,
    required this.formkey,
  }) : super(key: key);

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
        onPressed: onClickNext,
        buttonText: 'Next',
        children: [
          Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KTextFormField(
                  validator: Validator.validateAccNumber,
                  controller: accountNoController,
                  label: 'Account Number',
                  keyboardType: TextInputType.number,
                ),
                KTextFormField(
                  validator: Validator.validateConAccNumber,
                  controller: confirmNoController,
                  label: 'Confirm Account Number',
                  keyboardType: TextInputType.number,
                ),
                KTextFormField(
                  validator: Validator.validateText,
                  controller: bankNameController,
                  label: 'Bank Name',
                  keyboardType: null,
                ),
                KTextFormField(
                  validator: Validator.validateIFSC,
                  controller: ifscCodeController,
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
