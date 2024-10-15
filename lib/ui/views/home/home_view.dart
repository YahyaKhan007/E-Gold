import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_strings.dart';
import '../choose_payment_method/choose_payment_method_view.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: kcAppBackgroundColor,
          body: Container(
              height: size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/back_home.png'),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    topRow(viewModel),
                    goldenContainer(viewModel, size),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: walletTypes(viewModel, size),
                    ),
                    verticalSpaceMedium,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChoosePaymentMethodView(
                              showBack: true,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 48,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: kcProfitColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/gold_icon.png',
                              scale: 2.5,
                            ),
                            horizontalSpaceSmall,
                            const Text(
                              "BUY GOLD",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kcTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  Widget topRow(HomeViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 00, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 16, // Adjust the radius to your desired size
            backgroundImage: viewModel.userService.user!.profileImg.isNotEmpty
                ? NetworkImage(viewModel.userService.user!.profileImg)
                : const AssetImage(profile) as ImageProvider,
          ),
          horizontalSpaceSmall,
          Expanded(
            child: Text(
              "Hi ${viewModel.userService.user!.name}!",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          GestureDetector(
            onTap: viewModel.notification,
            child: Image.asset(
              'assets/images/wallet.png',
              height: 20,
            ),
          )
        ],
      ),
    );
  }

  // ^ Wallet Types  ? Margin
  Widget walletTypes(HomeViewModel viewModel, Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kcAppBackgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Wallet",
                    style: TextStyle(
                        color: kcProfitColor,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                  verticalSpaceSmall,
                  FittedBox(
                    child: Text(
                      "AED ${viewModel.balanceService.balanceData!.balance.toString()}",
                      style: const TextStyle(
                          color: kcProfitColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.15,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kcAppBackgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Margin",
                    style: TextStyle(
                        color: kcProfitColor,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                  verticalSpaceSmall,
                  FittedBox(
                    child: Text(
                      (viewModel.totalMarginProfit)
                          .toStringAsFixed(2)
                          .toString(),
                      // viewModel.userService.user!.totalGoldHoldings.toString(),
                      style: const TextStyle(
                          color: kcProfitColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        verticalSpaceSmall,
        Container(
          height: size.height * 0.15,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kcAppBackgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Portfolio",
                style: TextStyle(
                    color: kcProfitColor,
                    fontSize: 23,
                    fontWeight: FontWeight.normal),
              ),
              verticalSpaceSmall,
              FittedBox(
                child: Text(
                  "${viewModel.userService.user!.totalGoldHoldings.toStringAsFixed(3)}g/AED ${(viewModel.userService.user!.totalGoldHoldings * currentGoldRate).toStringAsFixed(2).toString()}",
                  // viewModel.userService.user!.totalGoldHoldings.toString(),
                  style: const TextStyle(
                      color: kcProfitColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // ^ Gold Container
  Widget goldenContainer(HomeViewModel viewModel, Size size) {
    return Container(
        height: size.height * 0.3,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: kcAppBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.only(left: 15, right: 15, top: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: size.width,
                child: Stack(
                  children: [
                    SizedBox(
                      width: size.width * 0.55,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Lottie.asset('assets/lottie/live_rate.json',
                                    height: 30,
                                    options: LottieOptions(
                                        enableApplyingOpacityToLayers: true)),
                                horizontalSpaceTiny,
                                const Text(
                                  "Live Price",
                                  style: TextStyle(
                                      color: kcProfitColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            verticalSpaceTiny,
                            showLivePrice(viewModel),
                            // verticalSpaceTiny,
                            goldPurity(size: size),
                          ]),
                    ),
                    Positioned(
                        right: -20,
                        top: size.height * 0.06,
                        child: Image.asset(
                          'assets/images/gold.png',
                          height: size.height * 0.14,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: 1.h,
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: kcLightTextColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your current gold balance is:",
                    style: TextStyle(fontSize: 12, color: kcProfitColor),
                  ),
                  Text(
                    "${viewModel.userService.user!.totalGoldHoldings.toStringAsFixed(4)}g",
                    style: const TextStyle(fontSize: 12, color: kcProfitColor),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget goldPurity({required Size size}) {
    return Expanded(
      child: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceSmall,
            // Text(
            //   "this price includes 5% GST",
            //   style: TextStyle(color: kcProfitColor, fontSize: 12.sp),
            // ),
            // verticalSpaceSmall,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6.h),
              decoration: BoxDecoration(
                  color: kcProfitColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "24k - 99.9%",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showLivePrice(HomeViewModel viewModel) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset('assets/images/gold_ingots_gold_svgrepo_com1.png',
          //     height: 30),
          Text(
            "AED ",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                color: kcProfitColor,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold),
          ),
          viewModel.isBusy
              ? Text(
                  ' ...  ',
                  style: TextStyle(
                      color: kcProfitColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold),
                )
              : Text(
                  "${currentGoldRate.toStringAsFixed(2)}/G",
                  style: TextStyle(
                      color: kcProfitColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }

  transactionViewtypes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.blue),
            child: const Center(
                child: Text(
              'Bank',
              style: TextStyle(color: Colors.white),
            ))),
        Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
            child: const Center(
                child: Text(
              'Card',
              style: TextStyle(color: Colors.black),
            ))),
        Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300),
            child: const Center(
                child: Text(
              'Crypto',
              style: TextStyle(color: Colors.black),
            )))
      ]),
    );
  }

  Widget transactionTypes(BuildContext context,
      {required String image, required String text, required bool isSelected}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
          color: isSelected ? kcButtonBackground : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            color: isSelected ? Colors.grey.shade100 : Colors.black,
            height: 40,
          ),
          verticalSpaceSmall,
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
