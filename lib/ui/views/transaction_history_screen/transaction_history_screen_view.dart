import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/widgets/customHomeTransactionRow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'transaction_history_screen_viewmodel.dart';

class TransactionHistoryScreenView
    extends StackedView<TransactionHistoryScreenViewModel> {
  final bool check;
  const TransactionHistoryScreenView({
    Key? key,
    required this.check,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TransactionHistoryScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: check
          ? AppBar(
              centerTitle: true,
              title: const Text(
                'Transaction History',
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
            )
          : AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '02 Dec 2023',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcSuccessGreen,
                    buttonText: 'Completed',
                    btc: '+0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                    onTap: () {},
                    transactionDetails: TransactionDetails(
                        status: '',
                        totalPaid: 0,
                        totalBonus: 0,
                        transactionType: 'TopUp',
                        totalGoldBought: 0,
                        withdrawMethod: '',
                        walletType: '',
                        transactionDate: Timestamp.now(),
                        transactionId: ''),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcFailRed,
                    buttonText: 'Failed',
                    btc: '-0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                    onTap: () {},
                    transactionDetails: TransactionDetails(
                        status: '',
                        totalPaid: 0,
                        transactionType: 'TopUp',
                        totalBonus: 0,
                        totalGoldBought: 0,
                        withdrawMethod: '',
                        walletType: '',
                        transactionDate: Timestamp.now(),
                        transactionId: ''),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    transactionDetails: TransactionDetails(
                        status: '',
                        totalPaid: 0,
                        totalBonus: 0,
                        transactionType: 'TopUp',
                        totalGoldBought: 0,
                        withdrawMethod: '',
                        walletType: '',
                        transactionDate: Timestamp.now(),
                        transactionId: ''),
                    buttonColor: kcPendingGrey,
                    buttonText: 'Pending',
                    btc: '-0.001',
                    image: silver,
                    imageBack: kcSilverLight,
                    btcColor: kcSilverLight,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    transactionDetails: TransactionDetails(
                        status: '',
                        totalPaid: 0,
                        totalBonus: 0,
                        totalGoldBought: 0,
                        transactionType: 'TopUp',
                        withdrawMethod: '',
                        walletType: '',
                        transactionDate: Timestamp.now(),
                        transactionId: ''),
                    buttonColor: kcPendingGrey,
                    buttonText: 'Pending',
                    btc: '-0.001',
                    image: silver,
                    imageBack: kcSilverLight,
                    btcColor: kcSilverLight,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '02 Dec 2023',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    buttonColor: kcSuccessGreen,
                    buttonText: 'Completed',
                    btc: '+0.001',
                    image: silver,
                    imageBack: kcSilverLight,
                    btcColor: kcSilverLight,
                    onTap: () {},
                    transactionDetails: TransactionDetails(
                        status: '',
                        totalPaid: 0,
                        totalBonus: 0,
                        totalGoldBought: 0,
                        withdrawMethod: '',
                        transactionType: 'TopUp',
                        walletType: '',
                        transactionDate: Timestamp.now(),
                        transactionId: ''),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    transactionDetails: TransactionDetails(
                        status: '',
                        totalPaid: 0,
                        transactionType: 'TopUp',
                        totalBonus: 0,
                        totalGoldBought: 0,
                        withdrawMethod: '',
                        walletType: '',
                        transactionDate: Timestamp.now(),
                        transactionId: ''),
                    buttonColor: kcFailRed,
                    buttonText: 'Failed',
                    btc: '-0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeTransactionRow(
                    transactionDetails: TransactionDetails(
                        status: '',
                        totalPaid: 0,
                        totalBonus: 0,
                        transactionType: 'TopUp',
                        totalGoldBought: 0,
                        withdrawMethod: '',
                        walletType: '',
                        transactionDate: Timestamp.now(),
                        transactionId: ''),
                    buttonColor: kcPendingGrey,
                    buttonText: 'Pending',
                    btc: '-0.001',
                    image: bitCoin,
                    imageBack: kcYellowBright,
                    btcColor: kcYellowBright,
                    onTap: () {},
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
