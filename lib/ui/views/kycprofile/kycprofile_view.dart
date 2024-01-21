import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import '../../common/ui_helpers.dart';
import 'kycprofile_viewmodel.dart';

class KycprofileView extends StackedView<KycprofileViewModel> {
  const KycprofileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycprofileViewModel viewModel,
    Widget? child,
  ) {
    return KycLayoutWidget(
        title: 'Profile',
        subtitle: 'Please Upload Your Photo.',
        onPressed: () {},
        buttonText: 'Submit',
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
                          'Upload Photo',
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
                verticalSpaceMedium,
                const KTextFormField(
                    label: 'Date Of Birth',
                    keyboardType: TextInputType.datetime)
              ],
            ),
          )
        ]);
  }

  @override
  KycprofileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycprofileViewModel();
}
