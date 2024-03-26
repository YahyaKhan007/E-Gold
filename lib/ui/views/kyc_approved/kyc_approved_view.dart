import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'kyc_approved_viewmodel.dart';

class KycApprovedView extends StackedView<KycApprovedViewModel> {
  bool isApproved;
  KycApprovedView({Key? key, required this.isApproved}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    KycApprovedViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'KYC',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
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
          Container(
            margin: EdgeInsets.only(top: size.height * 0.13),
            padding: const EdgeInsets.only(
              left: 25.0,
              right: 25.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(
                  25.0,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      verticalSpaceMassive,
                      Center(
                        child: Image.asset(
                          "assets/images/success.png",
                          height: 240,
                          width: 240,
                        ),
                      ),
                      const Text(
                        "KYC Completed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      verticalSpaceMassive,
                      isApproved
                          ? Text(
                              'Congratulations your documents has been approved',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          : Text(
                              'You documents has been submitted but not approved, we wil get back to you soon',
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
            ),
          ),
        ],
      ),
    );
  }

  @override
  KycApprovedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      KycApprovedViewModel();
}
