import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import '../../common/ui_helpers.dart';

import 'kycidcardback_viewmodel.dart';

class KycidcardbackView extends StackedView<KycidcardbackViewModel> {
  VoidCallback onCnicBack;
  VoidCallback onClickNext;
 ValueChanged<bool?> onChangedCheckbox;
  final bool concent;
  KycidcardbackView(
      {Key? key,
      required this.onCnicBack,
      required this.onChangedCheckbox,
      required this.concent,
      required this.onClickNext})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycidcardbackViewModel viewModel,
    Widget? child,
  ) {
    return KycLayoutWidget(
        title: 'Identity Card (Back)',
        subtitle:
            'Please upload your Identity Card below for completing your second step of KYC.',
        onPressed: onClickNext,
        buttonText: 'Next',
        children: [
          Form(
            key: null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                Center(
                  child: Container(
                    height: 132,
                    width: 300,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(.75),
                            blurRadius: 2.5,
                            spreadRadius: 1.25),
                      ],
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Upload Identity Card Back Photo',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        verticalSpaceSmall,
                        ElevatedButton(
                          onPressed: onCnicBack,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(128, 48),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: const StadiumBorder(
                              side: BorderSide(),
                            ),
                          ),
                          child: const Text("+ Upload"),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: concent,
                      onChanged: onChangedCheckbox,
                    ),
                    const SizedBox(
                      width: 244,
                      child: Text(
                          'I hereby agree that the above document belongs to me and voluntarily give my consent to E-Gold Capital Pvt Ltd to utilize it as my address proof for KYC on purpose only'),
                    ),
                  ],
                ),
                verticalSpace(150.0),
              ],
            ),
          )
        ]);
  }

  @override
  KycidcardbackViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycidcardbackViewModel();
}
