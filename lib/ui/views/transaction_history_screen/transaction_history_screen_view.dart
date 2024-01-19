import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customHomeTransactionRow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'transaction_history_screen_viewmodel.dart';

class TransactionHistoryScreenView
    extends StackedView<TransactionHistoryScreenViewModel> {
  const TransactionHistoryScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TransactionHistoryScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Transaction History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '02 Dec 2023',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcSuccessGreen,
                    buttonText: 'Completed',
                    btc: '+0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcFailRed,
                    buttonText: 'Failed',
                    btc: '-0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcPendingGrey,
                    buttonText: 'Pending',
                    btc: '-0.001',
                    image: silver,
                    imageBack: kcSilverLight,
                    btcColor: kcSilverLight,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcPendingGrey,
                    buttonText: 'Pending',
                    btc: '-0.001',
                    image: silver,
                    imageBack: kcSilverLight,
                    btcColor: kcSilverLight,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '02 Dec 2023',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcSuccessGreen,
                    buttonText: 'Completed',
                    btc: '+0.001',
                    image: silver,
                    imageBack: kcSilverLight,
                    btcColor: kcSilverLight,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcFailRed,
                    buttonText: 'Failed',
                    btc: '-0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcPendingGrey,
                    buttonText: 'Pending',
                    btc: '-0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  TransactionHistoryScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactionHistoryScreenViewModel();
}
