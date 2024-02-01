import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customAddPaymentMethod.dart';
import 'package:e_gold/ui/widgets/custompaymentTitleChoose.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Center(
          child: Text(
            'Choose Payment Method',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add a payment Method',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            choosePaymentTile(
              balance: viewModel.crytpoService.cryptoData!.balance.toString(),
              margin: viewModel.crytpoService.cryptoData!.balance.toString(),
              image: crypto,
              title: 'Crypto',
              text: 'Deposit from your crypto app',
              onPressed: viewModel.openBuyCrypto,
            ),
            const SizedBox(
              height: 20,
            ),
            choosePaymentTile(
              balance: viewModel.bankService.bankData!.balance.toString(),
              margin: viewModel.bankService.bankData!.balance.toString(),
              image: masterCard,
              title: 'Debit or Credit Card',
              text: 'Use Visa, Master and more',
              onPressed: viewModel.openBuyCard,
            ),
            const SizedBox(
              height: 20,
            ),
            choosePaymentTile(
              balance: viewModel.bankService.bankData!.balance.toString(),
              margin: viewModel.bankService.bankData!.balance.toString(),
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
              balance: viewModel.inStoreService.instoreData!.balance.toString(),
              margin: viewModel.inStoreService.instoreData!.balance.toString(),
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
    );
  }

  @override
  ChoosePaymentMethodViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChoosePaymentMethodViewModel();
}
