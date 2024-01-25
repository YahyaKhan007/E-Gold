import 'package:e_gold/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class CreateanaccountViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  final List<Map<String, dynamic>> buttonData = [
    {'text': 'Continue with Phone', 'icon': 'assets/icons/smartphone.svg'},
    {'text': 'Continue with Apple', 'icon': 'assets/icons/apple_logo.svg'},
    {'text': 'Continue with Google', 'icon': 'assets/icons/google.svg'},
    {
      'text': 'Continue with Facebook',
      'icon': 'assets/icons/facebook_circled.svg'
    },
  ];

  handleButtonPress(int buttonNumber) {
    if (buttonNumber == 0) {
      _navigator.navigateToPhoneSignUpView();
    }
    if (buttonNumber == 1) {
      _navigator.navigateToSignupView();
    }
    if (buttonNumber == 2) {}
    if (buttonNumber == 3) {}
    if (buttonNumber == 4) {}
  }

  void onPressedLogin() {
    _navigator.replaceWithLoginView();
  }

  void onPressedSignup() {
    _navigator.replaceWithSignupView();
  }
}
