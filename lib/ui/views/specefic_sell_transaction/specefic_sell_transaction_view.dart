import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'specefic_sell_transaction_viewmodel.dart';

class SpeceficSellTransactionView
    extends StackedView<SpeceficSellTransactionViewModel> {
  final TransactionDetails sellTransactionDetails;

  const SpeceficSellTransactionView(Key? key,
      {required this.sellTransactionDetails})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SpeceficSellTransactionViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              viewModel.onBack();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          "Sold Transaction",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back_home.png'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              margin: EdgeInsets.only(top: size.height * 0.15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/success.png',
                      height: 150,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    transactionRow(
                        rowName: 'Transaction ID',
                        value: sellTransactionDetails.transactionId),
                    transactionRow(
                        rowName: 'Status',
                        value: sellTransactionDetails.status),
                    transactionRow(
                        rowName: 'Total Got Payment',
                        value: "${sellTransactionDetails.totalPaid} AED"),
                    transactionRow(
                        rowName: 'Total Got Payment',
                        value: "${sellTransactionDetails.totalPaid} AED"),
                    transactionRow(
                        rowName: 'Bonus Earned',
                        value: "${sellTransactionDetails.totalBonus} AED"),
                    transactionRow(
                        rowName: 'Total Gold Sold',
                        value:
                            "${sellTransactionDetails.totalGoldBought} grams"),
                    transactionRow(
                        rowName: 'Payment Methode',
                        value: sellTransactionDetails.walletType),
                    transactionRow(
                        rowName: 'Transaction Date',
                        value: viewModel.formattedDate(
                            sellTransactionDetails.transactionDate)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionRow({required String rowName, required var value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    rowName,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(value.toString()),
                ]),
          ),
          const Divider(
            height: 35,
          ),
        ],
      ),
    );
  }

  @override
  SpeceficSellTransactionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SpeceficSellTransactionViewModel();
}
