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
    return Scaffold(
      appBar: kAppBar(
          context: context,
          onButtonPressed: () {},
          title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpaceMedium,
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: viewModel.profilePictureUrl.isNotEmpty
                      ? NetworkImage(viewModel.profilePictureUrl)
                      : null,
                  child: viewModel.profilePictureUrl.isEmpty
                      ? const Icon(
                          Icons.camera_alt,
                          size: 50,
                        )
                      : null,
                ),
              ),
              verticalSpaceSmall,
              KTextFormField(
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
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              verticalSpaceSmall,
              InternationalPhoneNumberInput(onInputChanged: (value) {}),
              verticalSpaceSmall,
              KTextFormField(
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
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
    );
  }


  @override
  EditProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditProfileViewModel();
}
