import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

class EditProfileView extends StackedView<EditProfileViewModel> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: kAppBar(
            context: context,
            onButtonPressed: viewModel.onBack,
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            )),
        body: viewModel.isBusy
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      verticalSpaceMedium,
                      GestureDetector(
                        onTap: () {
                          viewModel.changeProfileImg(context);
                        },
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: viewModel.profileImgUrl.isNotEmpty
                              ? NetworkImage(viewModel.profileImgUrl ?? '')
                              : null,
                          child: viewModel.profileImgUrl.isEmpty
                              ? const Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                )
                              : null,
                        ),
                      ),
                      verticalSpaceSmall,
                      KTextFormField(
                        controller: viewModel.firstNameController,
                        label: 'Full Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a full name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                      verticalSpaceSmall,
                      KTextFormField(
                        readOnly: true,
                        controller: viewModel.emailController,
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      verticalSpaceSmall,
                      InternationalPhoneNumberInput(
                        textFieldController: viewModel.phoneNoController,
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                          print(viewModel.phoneNoController.text);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                      ),
                      verticalSpaceSmall,
                      KTextFormField(
                        onTap: () {
                          viewModel.onTapDobDialog(context);
                        },
                        readOnly: true,
                        controller: viewModel.dobController,
                        label: 'Date of Birth',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      verticalSpaceMedium,
                      ElevatedButton(
                        onPressed: viewModel.submitForm,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  @override
  EditProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditProfileViewModel();

  @override
  void onViewModelReady(EditProfileViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
