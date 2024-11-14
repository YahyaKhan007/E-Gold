import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'terms_condition_viewmodel.dart';

class TermsConditionView extends StackedView<TermsConditionViewModel> {
  const TermsConditionView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TermsConditionViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Terms and Conditions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: InkWell(
          onTap: viewModel.onBack,
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back_home.png'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: size.height * 0.13,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 00, bottom: 32),
              decoration: const BoxDecoration(
                  // color: Colors.white,    color: Colors.red,

                  color: kcAppBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: screenHeight(context) * 0.88,
              width: screenWidth(context),
              child: WebViewWidget(
                controller: viewModel.controller,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(TermsConditionViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  TermsConditionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TermsConditionViewModel();
}
