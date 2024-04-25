// ignore_for_file: must_be_immutable

import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/custompaymentTitleChoose.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'choose_payment_method_viewmodel.dart';

class ChoosePaymentMethodView
    extends StackedView<ChoosePaymentMethodViewModel> {
  bool? showBack;

  ChoosePaymentMethodView({
    Key? key,
    this.showBack = false,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChoosePaymentMethodViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kcAppBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: showBack == true
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: kcTextColor,
                ),
              )
            : null,
        title: const Text(
          'Buy Gold',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
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
            top: size.height * 0.12,
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                  color: kcAppBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              // padding: const EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                  choosePaymentTile(
                    balance:
                        viewModel.crytpoService.cryptoData!.balance.toString(),
                    margin:
                        viewModel.crytpoService.cryptoData!.margin.toString(),
                    image: crypto,
                    title: 'Crypto',
                    text: 'Deposit from your crypto app',
                    onPressed: () async {
                      if (await viewModel.kycService.isKycApproved()) {
                        viewModel.openBuyCrypto();
                      } else {
                        viewModel.snackbarService.showSnackbar(
                          message:
                              'Please Go to KYC Section and enter KYC details and wait for approval ',
                          title: 'KYC Not Found',
                          duration: const Duration(seconds: 2),
                        );
                      }
                    },
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
                      onPressed: () async {
                        if (await viewModel.kycService.isKycApproved()) {
                          viewModel.openBuyCard();
                        } else {
                          viewModel.snackbarService.showSnackbar(
                            message:
                                'Please Go to KYC Section and enter KYC details and wait for approval ',
                            title: 'KYC Not Found',
                            duration: const Duration(seconds: 2),
                          );
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  choosePaymentTile(
                    balance: viewModel.bankService.bankData!.balance.toString(),
                    margin: viewModel.bankService.bankData!.balance.toString(),
                    image: bank,
                    title: 'Link Bank Account',
                    text: 'Connect bank for easy deposits',
                    onPressed: () async {
                      if (await viewModel.kycService.isKycApproved()) {
                        viewModel.openBuyBank();
                      } else {
                        viewModel.snackbarService.showSnackbar(
                          message:
                              'Please Go to KYC Section and enter KYC details and wait for approval ',
                          title: 'KYC Not Found',
                          duration: const Duration(seconds: 2),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  choosePaymentTile(
                    image: store,
                    balance: viewModel.inStoreService.instoreData!.balance
                        .toString(),
                    margin:
                        viewModel.inStoreService.instoreData!.margin.toString(),
                    title: 'In-store',
                    text: 'Deposit in-person at our stores',
                    onPressed: () async {
                      if (await viewModel.kycService.isKycApproved()) {
                        viewModel.openBuyInStore();
                      } else {
                        viewModel.snackbarService.showSnackbar(
                          message:
                              'Please Go to KYC Section and enter KYC details and wait for approval ',
                          title: 'KYC Not Found',
                          duration: const Duration(seconds: 2),
                        );
                      }
                    },
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
  ChoosePaymentMethodViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChoosePaymentMethodViewModel();
}
