import 'package:e_gold/ui/common/app_colors.dart';
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
  VoidCallback onTapDOB;
  bool profileImgupLoaded;
  VoidCallback sumbitKyc;
  KycprofileView(
      {Key? key,
      required this.uploadProfile,
      required this.onTapDOB,
      required this.dobController,
      required this.profileImgupLoaded,
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
        hintStyle: const TextStyle(
          color: Color(0xff000D5E),
        ),
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
          Container(
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                //   colors: [
                //     Color(0xFFB3E5FC), // Light blue
                //     Color(0xFFE1F5FE), // Lighter blue
                //   ],
                // ),
                ),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  Center(
                    child: Container(
                      height: 132,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black54,
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Photo',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black),
                          ),
                          verticalSpaceSmall,
                          ElevatedButton(
                            onPressed: uploadProfile,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(128, 48),
                              foregroundColor: kcAppBackgroundColor,
                              backgroundColor: profileImgupLoaded
                                  ? kcAppBackgroundColor
                                  : Colors.white,
                              elevation: 0,
                              shape: const StadiumBorder(
                                side: BorderSide(),
                              ),
                            ),
                            child: profileImgupLoaded
                                ? const Text(
                                    "Uploaded",
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const Text("+ Upload"),
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  InkWell(
                    onTap: onTapDOB,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceTiny,
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Date of Birth',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        verticalSpaceTiny,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: TextFormField(
                            onTap: onTapDOB,
                            readOnly: true,
                            validator: Validator.validateCnic,
                            controller: dobController,
                            decoration: inputDecoration(
                              'Date of Birth',
                            ),
                          ),
                        ),
                        verticalSpaceTiny,
                      ],
                    ),
                  )
                ],
              ),
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
