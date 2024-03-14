import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: viewModel.onBack,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back_home.png'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height * 0.13,
            child: viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  )
                : SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      height: screenHeight(context),
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            verticalSpaceMedium,
                            SizedBox(
                              height: size.height * 0.7,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        viewModel.changeProfileImg(context);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 5,
                                              offset: Offset(1, -2),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              kcLightButtonBackground,
                                          radius: 58,
                                          backgroundImage: viewModel
                                                  .profileImgUrl.isNotEmpty
                                              ? NetworkImage(
                                                  viewModel.profileImgUrl ?? '')
                                              : null,
                                          child: viewModel.profileImgUrl.isEmpty
                                              ? const Icon(
                                                  Icons.camera_alt,
                                                  size: 50,
                                                  color: Colors.white,
                                                )
                                              : null,
                                        ),
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
                                      initialValue: viewModel.initialValue,
                                      textFieldController:
                                          viewModel.phoneNoController,
                                      onInputChanged: (PhoneNumber number) {
                                        viewModel.countryCode = number.isoCode!;
                                      },
                                      onSaved: (PhoneNumber number) {
                                        viewModel.countryCode = number.isoCode!;
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
                                  ],
                                ),
                              ),
                            ),
                            verticalSpaceMedium,
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 5,
                                    offset: Offset(1, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: viewModel.submitForm,
                                child: const Text('Save'),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
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
