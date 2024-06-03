import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/userProfile.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../home/home_viewmodel.dart';

class EditProfileViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userProfileService = locator<UserProfileService>();
  final picker = ImagePicker();
  final navigationService = locator<NavigationService>();
  String profileImgUrl = "";
  String countryCode = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  UserProfile? userProfile;
  PhoneNumber? initialValue;

  void onViewModelReady() async {
    setBusy(true);
    userProfile = HomeViewModel().userService.user;
    firstNameController.text = userProfile!.name;
    emailController.text = userProfile!.email;
    countryCode = userProfile!.countryCode;
    phoneNoController.text = userProfile!.phoneNumber;
    initialValue = PhoneNumber(
        dialCode: userProfile!.countryCode, phoneNumber: '', isoCode: 'AE');
    dobController.text = userProfile!.dateOfBirth;
    profileImgUrl = userProfile!.profileImg;
    setBusy(false);
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      userProfile?.countryCode = countryCode;
      userProfile?.name = firstNameController.text;
      userProfile?.email = emailController.text;
      userProfile?.phoneNumber = phoneNoController.text;
      userProfile?.dateOfBirth = dobController.text;
      await userProfileService.updateUserToFirestore(userProfile!);
      await userProfileService.getUser();
      navigationService.replaceWithDashboardScreenView();
    }
  }

  void onBack() {
    navigationService.back();
  }

  void changeProfileImg(BuildContext context) async {
    File? selectedImage = await showOptions(context);

    if (selectedImage != null) {
      String imageUrl =
          await userProfileService.uploadImageToStorage(selectedImage);
      userProfile!.profileImg = imageUrl;
      notifyListeners();
    }
  }

  Future<File?> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File selectedImage = File(pickedFile.path);
      notifyListeners();
      return selectedImage;
    }

    return null;
  }

  Future<File?> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File capturedImage = File(pickedFile.path);
      notifyListeners();
      return capturedImage;
    }

    return null;
  }

  Future<File> showOptions(BuildContext context) async {
    Completer<File> completer = Completer<File>();

    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () async {
              Navigator.of(context).pop();
              completer.complete(await getImageFromGallery());
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () async {
              Navigator.of(context).pop();
              completer.complete(await getImageFromCamera());
            },
          ),
        ],
      ),
    );

    return completer.future;
  }

  void onTapDobDialog(BuildContext context) async {
    var datePicked = await DatePicker.showSimpleDatePicker(
      context,
      firstDate: DateTime(1970),
      lastDate: DateTime(2090),
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.en_us,
      looping: true,
    );
    if (datePicked != null) {
      dobController.text =
          DateFormat("dd-MMMM-yyyy").format(datePicked).toString();
    }
  }
}
