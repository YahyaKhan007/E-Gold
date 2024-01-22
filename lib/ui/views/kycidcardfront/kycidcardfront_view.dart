import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import '../../common/ui_helpers.dart';

import 'kycidcardfront_viewmodel.dart';

class KycidcardfrontView extends StackedView<KycidcardfrontViewModel> {
  const KycidcardfrontView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycidcardfrontViewModel viewModel,
    Widget? child,
  ) {
    var outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        borderRadius: BorderRadius.circular(12.0));

    return KycLayoutWidget(
        // onPressed: () {},
        title: 'Identity Card (Front)',
        subtitle:
            'Please upload your Identity Card below for\ncompleting your first step of KYC.',
        onPressed: () {},
        buttonText: 'Next',
        children: [
          Form(
            key: null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Identity Card Number',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                verticalSpaceSmall,
                TextFormField(
                  controller: viewModel.cnicController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(15),
                  ],
                  decoration: InputDecoration(
                    floatingLabelStyle: Theme.of(context).textTheme.titleLarge,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                    errorBorder: outlineInputBorder,
                    hintText: 'Enter CNIC Number',
                    errorText: viewModel.formattedCNIC.isNotEmpty &&
                            viewModel.formattedCNIC.length != 15
                        ? 'Invalid CNIC Number'
                        : null,
                  ),
                ),
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
                          'Upload Identity Card Front Photo',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        verticalSpaceSmall,
                        ElevatedButton(
                          onPressed: () {},
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
              ],
            ),
          )
        ]);
  }

  @override
  KycidcardfrontViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycidcardfrontViewModel();
}
