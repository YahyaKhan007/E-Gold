import 'package:stacked/stacked.dart';

class KycidcardbackViewModel extends BaseViewModel {
   bool concentAgreement = false;

  void onChangedCheckbox(bool? value) {
    concentAgreement = value ?? false;
    notifyListeners();
  }

}
