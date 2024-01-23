import 'package:e_gold/ui/common/validator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_widgets.dart';
import '../../common/ui_helpers.dart';
import 'kycprofile_viewmodel.dart';

class KycprofileView extends StackedView<KycprofileViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController();
  VoidCallback uploadProfile;
  VoidCallback sumbitKyc;
  KycprofileView(
      {Key? key,
      required this.uploadProfile,
      required this.dobController,
      required this.sumbitKyc,
      required this.formkey})
      : super(key: key);
  var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
      borderRadius: BorderRadius.circular(12.0));

  inputDecoration(String value) => InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        hintText: 'Enter $value',
      );
  @override
  Widget builder(
    BuildContext context,
    KycprofileViewModel viewModel,
    Widget? child,
  ) {
    return KycLayoutWidget(
        title: 'Profile',
        subtitle: 'Please Upload Your Photo.',
        onPressed: sumbitKyc,
        buttonText: 'Submit',
        children: [
          Form(
            key: formkey,
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
                          onPressed: uploadProfile,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceTiny,
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Date of Birth',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    verticalSpaceTiny,
                    TextFormField(
                      validator: Validator.validateCnic,
                      controller: dobController,
                      decoration: inputDecoration('Date of Birth'),
                    ),
                    verticalSpaceTiny,
                  ],
                )
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
