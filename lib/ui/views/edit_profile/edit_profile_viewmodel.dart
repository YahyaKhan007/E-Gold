import 'dart:async';
import 'dart:io';

import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/userProfile.dart';
import 'package:e_gold/services/userProfileService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userProfileService = locator<UserProfileService>();
  final picker = ImagePicker();
  final navigationService = locator<NavigationService>();
  String profileImgUrl = "";
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  UserProfile? userProfle;

  void onViewModelReady() async {
    setBusy(true);
    userProfle = await userProfileService.getUserProfileFromFirestore();
    firstNameController.text = userProfle!.name;
    emailController.text = userProfle!.email;
    phoneNoController.text = userProfle!.phoneNumber;
    dobController.text = userProfle!.dateOfBirth;
    profileImgUrl = userProfle!.profileImg;
    setBusy(false);
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      userProfle?.name = firstNameController.text;
      userProfle?.email = emailController.text;
      userProfle?.phoneNumber = phoneNoController.text;
      userProfle?.dateOfBirth = dobController.text;
      await userProfileService.updateUserToFirestore(userProfle!);
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
      // Upload the selected image to storage
      String imageUrl =
          await userProfileService.uploadImageToStorage(selectedImage);

      // Update the UserProfile with the new image URL
      userProfle!.profileImg = imageUrl;

      // Notify listeners to update the UI with the new image
      notifyListeners();
    }
  }

  Future<File?> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File selectedImage = File(pickedFile.path);
      notifyListeners();
      return selectedImage; // Return the File instance
    }

    return null; // Return null if no image was selected
  }

// Image Picker function to get image from camera
  Future<File?> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File capturedImage = File(pickedFile.path);
      notifyListeners();
      return capturedImage; // Return the File instance
    }

    return null; // Return null if no image was captured
  }

// Show options to get image from camera or gallery
  Future<File> showOptions(BuildContext context) async {
    Completer<File> completer = Completer<File>();

    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () async {
              // Close the options modal
              Navigator.of(context).pop();
              // Get image from gallery and complete the Future
              completer.complete(await getImageFromGallery());
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () async {
              // Close the options modal
              Navigator.of(context).pop();
              // Get image from camera and complete the Future
              completer.complete(await getImageFromCamera());
            },
          ),
        ],
      ),
    );

    // Return the Future that completes when the user selects an image
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
    dobController.text = datePicked.toString();
  }
}
