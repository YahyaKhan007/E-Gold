import 'package:e_gold/ui/views/kyc/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'pages/id_card_front.dart';

class KycViewModel extends BaseViewModel {
  final PageController pageController = PageController();
  int currentPage = 0;

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

  List<Widget> pages = [
    const IdCardFrontPage(),
    KycLayoutWidget(
      onPressed: () {},
      title: '',
      subtitle: '',
      children: const [],
    )
  ];

  void onPageChanged(int value) {
    currentPage = value;
    rebuildUi();
  }
}
