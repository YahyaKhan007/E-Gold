import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kyc_completed_viewmodel.dart';

class KycCompletedView extends StackedView<KycCompletedViewModel> {
  const KycCompletedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycCompletedViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'KYC Completed',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
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
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                verticalSpaceLarge,
                Center(
                  child: Image.asset(
                    "assets/images/success.png",
                    height: 200,
                    width: 200,
                  ),
                ),
                verticalSpaceMassive,
                Text(
                  'Thanks for submitting your document we’ll verify it and complete your KYC as soon as possible.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpaceMedium,
                ElevatedButton.icon(
                  onPressed: viewModel.onPressedBackToHome,
                  style: ElevatedButton.styleFrom(minimumSize: null),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                  ),
                  label: const Text("Back to Home"),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  @override
  KycCompletedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycCompletedViewModel();
}
