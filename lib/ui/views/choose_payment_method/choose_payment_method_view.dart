import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customAddPaymentMethod.dart';
import 'package:e_gold/ui/widgets/custompaymentTitleChoose.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'choose_payment_method_viewmodel.dart';

class ChoosePaymentMethodView
    extends StackedView<ChoosePaymentMethodViewModel> {
  const ChoosePaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChoosePaymentMethodViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Center(
          child: Text(
            'Choose Payment Method',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
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
            top: size.height * 0.14,
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              // padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Add a payment Method',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    choosePaymentTile(
                      balance: viewModel.crytpoService.cryptoData!.balance
                          .toString(),
                      margin:
                          viewModel.crytpoService.cryptoData!.margin.toString(),
                      image: crypto,
                      title: 'Crypto',
                      text: 'Deposit from your crypto app',
                      onPressed: viewModel.openBuyCrypto,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    choosePaymentTile(
                      balance:
                          viewModel.bankService.bankData!.balance.toString(),
                      margin:
                          viewModel.bankService.bankData!.balance.toString(),
                      image: masterCard,
                      title: 'Debit or Credit Card',
                      text: 'Use Visa, Master and more',
                      onPressed: viewModel.openBuyCard,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    choosePaymentTile(
                      balance:
                          viewModel.bankService.bankData!.balance.toString(),
                      margin:
                          viewModel.bankService.bankData!.balance.toString(),
                      image: bank,
                      title: 'Link Bank Account',
                      text: 'Connect bank for easy deposits',
                      onPressed: viewModel.openBuyBank,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    choosePaymentTile(
                      image: store,
                      balance: viewModel.inStoreService.instoreData!.balance
                          .toString(),
                      margin: viewModel.inStoreService.instoreData!.margin
                          .toString(),
                      title: 'In-store',
                      text: 'Deposit in-person at our stores',
                      onPressed: viewModel.openBuyInStore,
                    ),
                    const SizedBox(
                      height: 20,
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
  ChoosePaymentMethodViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChoosePaymentMethodViewModel();
}
