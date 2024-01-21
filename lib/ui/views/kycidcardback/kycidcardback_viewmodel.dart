import 'package:stacked/stacked.dart';

class KycidcardbackViewModel extends BaseViewModel {
  bool isChecked = false;
  void onChangedCheckbox(bool? value) {
    rebuildUi();
    isChecked = !isChecked;
  }
}
