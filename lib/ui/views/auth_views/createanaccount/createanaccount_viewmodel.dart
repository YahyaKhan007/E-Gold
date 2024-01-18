import 'package:e_gold/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class CreateanaccountViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  final List<Map<String, dynamic>> buttonData = [
    {'text': 'Signup with Phone', 'icon': MdiIcons.phone},
    {'text': 'Signup with Email', 'icon': Icons.email},
    {'text': 'Signup with Apple', 'icon': Icons.apple},
    {'text': 'Signup with Google', 'icon': MdiIcons.google},
    {'text': 'Signup with Facebook', 'icon': Icons.facebook},
  ];

  handleButtonPress(int buttonNumber) {
    if (buttonNumber == 0) {
      _navigator.navigateToSignupView();
    }
    if (buttonNumber == 1) {
      _navigator.navigateToSignupView();
    }
    if (buttonNumber == 2) {}
    if (buttonNumber == 3) {}
    if (buttonNumber == 4) {}
  }

  void onButtonPressed() {
    _navigator.replaceWithLoginView();
  }
}
