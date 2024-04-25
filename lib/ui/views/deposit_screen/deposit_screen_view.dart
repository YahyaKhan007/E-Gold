import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/widgets/customAddPaymentMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'deposit_screen_viewmodel.dart';

class DepositScreenView extends StackedView<DepositScreenViewModel> {
  const DepositScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DepositScreenViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Top Up',
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
      extendBodyBehindAppBar: true,
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              decoration: const BoxDecoration(
                  color: kcAppBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSpaceSmall,
                  const Text(
                    'Choose a payment Method',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kcTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AddPaymentMethod(
                    image: crypto,
                    title: 'Crypto',
                    text: 'Deposit from your crypto app',
                    onPressed: viewModel.toCryptoPayment,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AddPaymentMethod(
                    image: masterCard,
                    title: 'Debit or Credit Card',
                    text: 'Use Visa, Master and more',
                    onPressed: () async {
                      await viewModel.createPaymentIntent();
                      await viewModel.processPayment();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AddPaymentMethod(
                    image: bank,
                    title: 'Link Bank Account',
                    text: 'Connect bank for easy deposits',
                    onPressed: viewModel.linkBankAccount,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AddPaymentMethod(
                    image: store,
                    title: 'In-store',
                    text: 'Deposit in-person at our stores',
                    onPressed: viewModel.toInStorePayment,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  DepositScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DepositScreenViewModel();
}
