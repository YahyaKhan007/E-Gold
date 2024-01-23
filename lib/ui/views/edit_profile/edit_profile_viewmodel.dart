import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String bio = '';
  String profilePictureUrl = '';

  void submitForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
