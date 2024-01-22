import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customAddPaymentMethod.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Deposit',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: viewModel.goBack,
          icon: const Icon(Icons.arrow_back_ios),
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
            AddPaymentMethod(
              image: crypto,
              title: 'Crypto',
              text: 'Deposit from your crypto app',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            AddPaymentMethod(
              image: masterCard,
              title: 'Debit or Credit Card',
              text: 'Use Visa, Master and more',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            AddPaymentMethod(
              image: bank,
              title: 'Link Bank Account',
              text: 'Connect bank for easy deposits',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            AddPaymentMethod(
              image: store,
              title: 'In-store',
              text: 'Deposit in-person at our stores',
              onPressed: () {},
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
  DepositScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DepositScreenViewModel();
}
