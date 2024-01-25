import 'dart:async';
import 'dart:io';

import 'package:e_gold/app/app.locator.dart';
import 'package:e_gold/app/app.router.dart';
import 'package:e_gold/models/kyc.dart';
import 'package:e_gold/services/kyc_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class KycViewModel extends BaseViewModel {
  final PageController pageController = PageController();

  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

  final GlobalKey<FormState> formKey4 = GlobalKey<FormState>();

  final GlobalKey<FormState> formKey5 = GlobalKey<FormState>();
  final kycService = locator<KycService>();
  bool concentAgreement = false;
  String? idFrontImgPath;
  late Future<File?> idFront;
  String? idBackImgPath;
  final navigationService = locator<NavigationService>();
  bool idFrontUpload = false;
  bool idBackUpload = false;
  bool idProfileImgUpload = false;
  String? passportImgPath;
  String? profileImgPath;
  final picker = ImagePicker();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController passportNoController = TextEditingController();
  final TextEditingController accountNoController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController confirmAccountController =
      TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  int currentPage = 0;

  void onViewModelReady() async {
    setBusy(true);

    setBusy(false);
  }

  void onClickIdFrontNext() {}
  void onPageChanged(int value) {
    currentPage = value;
    rebuildUi();
  }

  void onClickUpload() {
    print(cnicController.text);
  }

  void onCnicBackUpload(BuildContext context) async {
    try {
      File idBackImage = await showOptions(context);
      if (idBackImage != null) {
        idBackImgPath = await kycService.uploadImage(idBackImage);
        idBackUpload = true;
        notifyListeners();
        print('HassanBack${idBackImgPath}');
      }
    } catch (error) {
      // Handle any potential errors here
      print('Error: $error');
    }
  }

  void uploadProfileImg(BuildContext context) async {
    try {
      File idProfileImage = await showOptions(context);
      if (idProfileImage != null) {
        profileImgPath = await kycService.uploadImage(idProfileImage);
        idProfileImgUpload = true;
        notifyListeners();
      }
    } catch (error) {
      // Handle any potential errors here
      print('Error: $error');
    }
  }

  Future<void> onCNICFrontUpload(BuildContext context) async {
    try {
      File idFrontImage = await showOptions(context);
      if (idFrontImage != null) {
        idFrontImgPath = await kycService.uploadImage(idFrontImage);
        idFrontUpload = true;
        notifyListeners();
      }
    } catch (error) {
      // Handle any potential errors here
      print('Error: $error');
    }
  }

  void onPressedButton() {
    if (currentPage < 5) {
      switch (currentPage) {
        case 0:
          if (formKey1.currentState?.validate() == true && idFrontUpload) {
            currentPage += 1;
          }
          break;
        case 1:
          if (idBackUpload) {
            currentPage += 1;
          }

          break;
        case 2:
          if (formKey3.currentState?.validate() == true) {
            currentPage += 1;
          }
          break;
        case 3:
          if (formKey4.currentState?.validate() == true) {
            currentPage += 1;
          }
          break;
        case 4:
          if (formKey5.currentState?.validate() == true && idProfileImgUpload) {
            currentPage += 1;
          }
          break;
      }

      rebuildUi();
    } else if (currentPage == 5) {
      //  navigationService.replaceWithKyccompletedView();
      rebuildUi();
    }
  }

  bool validateForm() {
    return formKey5.currentState?.validate() ?? false;
  }

  void submitKyc() {
    if (formKey5.currentState?.validate() == true && idProfileImgUpload) {
      KYC kycData;

      // KYC details for page 1
      kycData = KYC(
        concentAgreement: concentAgreement,
        isApproved: false,
        cnicNumber: cnicController.text ?? "",
        cardFrontPhotoLink: idFrontImgPath ?? "",
        cardBackPhotoLink: idBackImgPath ?? "",
        passportNumber: passportNoController.text ?? "",
        bankAccountNumber: accountNoController.text ?? "",
        bankName: bankNameController.text ?? "",
        ifscCode: ifscCodeController.text ?? "",
        profilePhotoLink: profileImgPath ?? "",
        dateOfBirth: dobController.text ?? '',
      );

      kycService.saveKYCData(kycData);
      navigationService.replaceWithKycCompletedView();
    }
  }

  void onChangedCheckbox(bool? value) {
    rebuildUi();
    concentAgreement = !concentAgreement;
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

  void onTapDob(BuildContext context) async {
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
