import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class KycidcardfrontViewModel extends BaseViewModel {
  final TextEditingController cnicController = TextEditingController();

  String formattedCNIC = '';

  void formatCNIC() {
    String text = cnicController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.length > 5) {
      text = '${text.substring(0, 5)}-${text.substring(5)}';
    }
    if (text.length > 13) {
      text = '${text.substring(0, 13)}-${text.substring(13)}';
    }

    formattedCNIC = text;
    rebuildUi();
  }

  void onViewModelReady() async {
    setBusy(true);
    cnicController.addListener(formatCNIC);
    setBusy(false);
  }

  @override
  void dispose() {
    cnicController.dispose();
    super.dispose();
  }
}
