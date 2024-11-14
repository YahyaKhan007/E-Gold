import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'about_us_viewmodel.dart';

class AboutUsView extends StackedView<AboutUsViewModel> {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AboutUsViewModel viewModel,
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
          'About Us',
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
                      const Text(
                        "About eGold24k",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      verticalSpaceSmall,
                      Text(
                        viewModel.htmlContent,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  AboutUsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutUsViewModel();
}
