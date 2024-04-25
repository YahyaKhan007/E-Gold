import 'dart:developer';

import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'transactiondetails_viewmodel.dart';

class TransactiondetailsView extends StackedView<TransactiondetailsViewModel> {
  final TransactionDetails transactionDetails;
  final double profitOrLoss;
  const TransactiondetailsView(
      {Key? key, required this.profitOrLoss, required this.transactionDetails})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TransactiondetailsViewModel viewModel,
    Widget? child,
  ) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        //backgroundColor: backgroundColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Transaction Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: viewModel.onBack,
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
            child: Container(
              width: size.width,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              decoration: const BoxDecoration(
                  color: kcAppBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: screenHeight(context),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  verticalSpaceMedium,
                  viewModel.transaction.transactionType == 'TopUp'
                      ? const Text(
                          "TopUp",
                          style: TextStyle(
                              fontSize: 40,
                              color: kcTextColor,
                              fontWeight: FontWeight.bold),
                        )
                      : viewModel.transaction.isSold == true
                          ? const Text(
                              "Transaction Sold",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: kcTextColor,
                                  fontWeight: FontWeight.bold),
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              height: 140,
                              width: screenWidth(context),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 7),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: kcAppBackgroundColor,
                                          // image: DecorationImage(
                                          //     image: AssetImage(
                                          //       'assets/images/back_home.png',
                                          //     ),
                                          //     fit: BoxFit.cover),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: kcContainerColor
                                                  .withOpacity(0.5),
                                              blurRadius: 0.5,
                                              offset: const Offset(-2, 2),
                                              spreadRadius: 0.5,
                                            ),
                                          ],
                                        ),
                                        height: 140,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Holding",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22)
                                                  .copyWith(color: kcTextColor),
                                            ),
                                            FittedBox(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "${viewModel.transaction.isSold ? 0 : viewModel.transaction.totalPaid.toStringAsFixed(2)} ",
                                                    style: const TextStyle(
                                                        color: kcTextColor,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  viewModel.transaction.isSold
                                                      ? const SizedBox()
                                                      : Text(
                                                          "${profitOrLoss > 0 ? "+" : ""}${profitOrLoss.toStringAsFixed(2)}",
                                                          style: TextStyle(
                                                              color: profitOrLoss >
                                                                      0
                                                                  ? Colors
                                                                      .greenAccent
                                                                  : profitOrLoss ==
                                                                          0
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .redAccent),
                                                        )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          color: kcAppBackgroundColor,
                                          // image: DecorationImage(
                                          //     image: AssetImage(
                                          //       'assets/images/back_home.png',
                                          //     ),
                                          //     fit: BoxFit.cover),
                                          boxShadow: [
                                            BoxShadow(
                                              color: kcContainerColor
                                                  .withOpacity(0.5),
                                              blurRadius: 0.5,
                                              offset: const Offset(2, 2),
                                              spreadRadius: 0.5,
                                            ),
                                          ],
                                        ),
                                        height: 140,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            transactionDetails
                                                        .transactionType !=
                                                    'Sell'
                                                ? Text(
                                                    profitOrLoss > 0
                                                        ? "Profit"
                                                        : profitOrLoss == 0
                                                            ? 'Profit / Loss'
                                                            : "Loss",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 22)
                                                        .copyWith(
                                                            color: profitOrLoss >
                                                                    0
                                                                ? Colors
                                                                    .greenAccent
                                                                : profitOrLoss ==
                                                                        0
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .redAccent),
                                                  )
                                                : Text(
                                                    transactionDetails
                                                                .totalBonus >
                                                            0
                                                        ? "Profit"
                                                        : transactionDetails
                                                                    .totalBonus ==
                                                                0
                                                            ? 'Profit / Loss'
                                                            : "Loss",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 22)
                                                        .copyWith(
                                                            color: transactionDetails
                                                                        .totalBonus >
                                                                    0
                                                                ? Colors
                                                                    .greenAccent
                                                                : transactionDetails
                                                                            .totalBonus ==
                                                                        0
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .redAccent),
                                                  ),
                                            transactionDetails
                                                        .transactionType ==
                                                    'Sell'
                                                ? Text(
                                                    "${viewModel.transaction.totalBonus.toStringAsFixed(2)} AED",
                                                    style: TextStyle(
                                                        color: transactionDetails
                                                                    .totalBonus >
                                                                0
                                                            ? Colors.greenAccent
                                                            : transactionDetails
                                                                        .totalBonus ==
                                                                    0
                                                                ? Colors.white
                                                                : Colors
                                                                    .redAccent,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    "${profitOrLoss.toStringAsFixed(2)} AED",
                                                    style: TextStyle(
                                                        color: profitOrLoss > 0
                                                            ? Colors.greenAccent
                                                            : profitOrLoss == 0
                                                                ? Colors.white
                                                                : Colors
                                                                    .redAccent,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                  viewModel.transaction.isSold == true
                      ? verticalSpaceTiny
                      : verticalSpaceLarge,
                  Visibility(
                      visible: viewModel.transaction.isSold == true,
                      child: GestureDetector(
                        onTap: () async {
                          var soldTransaction = await viewModel.getDocumentById(
                              viewModel.transaction.soldTransactionId);

                          if (soldTransaction == null) {
                            log('Transacion result is Empty');
                          } else {
                            viewModel.toSpeceficSellTransaction(soldTransaction,
                                viewModel.transaction.totalPaid.toString());
                          }

                          log(viewModel.transaction.soldTransactionId);
                          log("this should open the transactions in which it is sold");
                        },
                        child: const Text(
                          'View Details*',
                          style: TextStyle(color: Colors.red),
                        ),
                      )),
                  viewModel.transaction.isSold == true
                      ? verticalSpaceLarge
                      : verticalSpaceTiny,
                  SizedBox(
                    height: size.height * 0.5,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        List<String> values = [
                          viewModel.transaction.status,
                          viewModel.transaction.totalPaid.toString(),
                          viewModel.transaction.totalBonus.toString(),
                          viewModel.transaction.totalGoldBought.toString(),
                          viewModel.transaction.withdrawMethod,
                          viewModel.formattedDate(
                              viewModel.transaction.transactionDate),
                          viewModel.transaction.transactionId,
                        ];

                        List<String> names = [
                          'Status',
                          'Total Paid',
                          'Total Bonus',
                          'Total Gold Bought',
                          'Payment Method',
                          'Transaction Date',
                          'Transaction ID',
                        ];

                        return ListTile(
                          contentPadding: const EdgeInsets.only(
                              bottom: 8, left: 15, right: 15),
                          visualDensity: VisualDensity.compact,
                          titleTextStyle:
                              Theme.of(context).textTheme.titleMedium,
                          leadingAndTrailingTextStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: kcLightButtonBackground,
                                    fontWeight: FontWeight.w400,
                                  ),
                          title: index == 2 &&
                                  viewModel.transaction.transactionType ==
                                      'Sell'
                              ? viewModel.transaction.totalBonus >= 0
                                  ? const Text("Profit",
                                      style: TextStyle(color: kcTextColor))
                                  : const Text("Loss",
                                      style: TextStyle(color: kcTextColor))
                              : index == 3 &&
                                      viewModel.transaction.transactionType ==
                                          'Sell'
                                  ? const Text("Total Gold Sold",
                                      style: TextStyle(color: kcTextColor))
                                  : Text(
                                      names[index],
                                      style:
                                          const TextStyle(color: kcTextColor),
                                    ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${index == 0 && viewModel.transaction.isSold == true ? "Sold Successful" : values[index]} ${index == 2 || index == 1 ? "AED" : index == 3 ? 'grams' : ""}",
                                style: const TextStyle(color: kcLightText),
                              ),
                              index == 0 &&
                                      viewModel.transaction.isSold == true &&
                                      viewModel.transaction.transactionType ==
                                          'Buy'
                                  ? Visibility(
                                      visible: false,
                                      child: GestureDetector(
                                        onTap: () async {
                                          var soldTransaction =
                                              await viewModel.getDocumentById(
                                                  transactionDetails
                                                      .soldTransactionId);

                                          if (soldTransaction == null) {
                                            log('Transacion result is Empty');
                                          } else {
                                            viewModel.toSpeceficSellTransaction(
                                                soldTransaction,
                                                viewModel.transaction.totalPaid
                                                    .toString());
                                          }

                                          log(transactionDetails
                                              .soldTransactionId);
                                          log("this should open the transactions in which it is sold");
                                        },
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              " TX",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Icon(
                                                Icons.star,
                                                size: 6,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        );
                      },
                      itemCount: 7,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 1.0,
                          color: kcLightText,
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: !viewModel.transaction.isSold &&
                        viewModel.transaction.transactionType != 'TopUp',
                    child: GestureDetector(
                      onTap: () {
                        log(viewModel.transaction.isSold.toString());
                        viewModel.transaction.isSold
                            ? null
                            : viewModel.sellTransaction(transactionDetails);
                      },
                      child: Container(
                          height: 50,
                          width: size.width * 0.3,
                          decoration: const BoxDecoration(
                            color: kcProfitColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.white,
                            //     blurRadius: 5,
                            //     offset: Offset(2, 4),
                            //     spreadRadius: 0,
                            //   ),
                            // ],
                          ),
                          child: const Center(
                            child: Text(
                              'Sell',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )),
                    ),
                  ),
                  verticalSpaceLarge
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(TransactiondetailsViewModel viewModel) {
    viewModel.onViewModelReady(transactionDetails);
    super.onViewModelReady(viewModel);
  }

  @override
  TransactiondetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactiondetailsViewModel();
}
