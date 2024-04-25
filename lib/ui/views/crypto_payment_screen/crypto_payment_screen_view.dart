import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/widgets/cryptoGoldenContainer.dart';
import 'package:e_gold/ui/widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'crypto_payment_screen_viewmodel.dart';

class CryptoPaymentScreenView
    extends StackedView<CryptoPaymentScreenViewModel> {
  const CryptoPaymentScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CryptoPaymentScreenViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kcAppBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Enter Amount',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
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
          Positioned(
            top: size.height * 0.13,
            child: Form(
              key: viewModel.formKey,
              child: Container(
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                decoration: const BoxDecoration(
                    color: kcAppBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: viewModel.isBusy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          verticalSpaceMedium,
                          CustomTextField(
                            controller: viewModel.walletAddress,
                            title: 'Wallet Address',
                            keyboardType: TextInputType.text,
                            validator: viewModel.customValidator,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          CustomTextField(
                            controller: viewModel.securityPin,
                            title: 'Security Pin',
                            keyboardType: TextInputType.number,
                            validator: viewModel.customValidator,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () => viewModel.toContinue(context),
                                  child: Container(
                                    width: 150,
                                    height: 48,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 12),
                                    decoration: ShapeDecoration(
                                      color: kcProfitColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      // shadows: const [
                                      //   BoxShadow(
                                      //     color: Color(0x3FF5B119),
                                      //     blurRadius: 8,
                                      //     offset: Offset(2, 4),
                                      //     spreadRadius: 0,
                                      //   ),
                                      // ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: viewModel.addBalance,
                                  child: Container(
                                    width: 150,
                                    height: 48,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 12),
                                    decoration: ShapeDecoration(
                                      color: kcProfitColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      // shadows: const [
                                      //   BoxShadow(
                                      //     color: Color(0x3FF5B119),
                                      //     blurRadius: 8,
                                      //     offset: Offset(2, 4),
                                      //     spreadRadius: 0,
                                      //   ),
                                      // ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Add Balance',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CryptoPaymentScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CryptoPaymentScreenViewModel();
  @override
  void onViewModelReady(CryptoPaymentScreenViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }
}
