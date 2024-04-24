import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/transactiondetails/transactiondetails_view.dart';
import 'package:e_gold/ui/widgets/customHomeTransactionRow.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_images.dart';
import '../../common/app_strings.dart';
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
    double calculateProfitLoss(
        {required double gramsBought,
        required double buyRate,
        required double sellRate,
        required double conversionRate}) {
      double buyAmount = gramsBought * buyRate;
      double sellAmount = gramsBought * sellRate;
      // double buyInTola = gramsBought / conversionRate;
      double profitLoss = sellAmount - buyAmount;

      // Convert to tola for display purposes
      // double profitLossInTola = profitLoss / conversionRate;

      // print(
      //     'Bought $gramsBought grams of gold at $buyRate per gram for $buyAmount');
      // print('Sold for $sellRate per gram for $sellAmount');
      // print('Profit/Loss: $profitLoss grams or $profitLossInTola tola');

      return profitLoss;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: check ? const Color(0xFFB3E5FC) : Colors.transparent,
      backgroundColor: kcAppBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: check
          ? AppBar(
              centerTitle: true,
              title: const Text(
                'Transaction History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: IconButton(
                onPressed: viewModel.goBack,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            )
          : AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: const Text(
                'Transaction History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
      body:
          //  RefreshIndicator(
          //   onRefresh: viewModel.refreshData,
          //   child:
          SizedBox(
        child: Stack(
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
              child: SizedBox(
                height: size.height * 0.8,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Scrollbar(
                        thumbVisibility: false,
                        controller: viewModel.scrollController,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 00),
                          decoration: const BoxDecoration(
                              // color: Colors.white,
                              color: kcAppBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          height: screenHeight(context) * 0.8,
                          child: Column(
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                    bottom: 25,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      transactionTypes(
                                          model: viewModel,
                                          buttonText: 'All',
                                          context: context,
                                          onTap: () {
                                            viewModel.changeSelection(
                                                selection: 'All');
                                          },
                                          size: size),
                                      transactionTypes(
                                          model: viewModel,
                                          buttonText: 'Bank',
                                          context: context,
                                          onTap: () {
                                            viewModel.changeSelection(
                                                selection: 'Bank');
                                          },
                                          size: size),
                                      transactionTypes(
                                          model: viewModel,
                                          buttonText: 'Card',
                                          context: context,
                                          onTap: () {
                                            viewModel.changeSelection(
                                                selection: 'Card');
                                          },
                                          size: size),
                                      transactionTypes(
                                          model: viewModel,
                                          buttonText: 'Crypto',
                                          context: context,
                                          onTap: () {
                                            viewModel.changeSelection(
                                                selection: 'Crypto');
                                          },
                                          size: size),
                                    ],
                                  ),
                                ),
                              ),
                              viewModel.isSelected == 'All'
                                  ? viewModel.isBusy
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : Expanded(
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            controller:
                                                viewModel.scrollController,
                                            itemCount:
                                                viewModel.sortedList.length,
                                            itemBuilder: (context, index) {
                                              // List<TransactionDetails> sortedList = viewModel
                                              //     .transactionService.transactionDetails!.where((item)=>item.transactionType != 'Sell')
                                              // .toList(); // Copy the list to avoid modifying the original data
                                              viewModel.sortedList.sort(
                                                  (a, b) => b.transactionDate
                                                      .toDate()
                                                      .compareTo(a
                                                          .transactionDate
                                                          .toDate()));

                                              // TransactionDetails transaction =
                                              //     sortedList[index];

                                              TransactionDetails
                                                  transactionDetails =
                                                  viewModel.sortedList[index];

                                              Timestamp transactionDate =
                                                  transactionDetails
                                                      .transactionDate;
                                              DateTime transactionDateTime =
                                                  transactionDate.toDate();
                                              DateTime transactionDateOnly =
                                                  DateTime(
                                                transactionDateTime.year,
                                                transactionDateTime.month,
                                                transactionDateTime.day,
                                              );

                                              DateTime?
                                                  previousTransactionDateOnly;
                                              if (index > 0) {
                                                TransactionDetails
                                                    previousTransaction =
                                                    viewModel
                                                        .sortedList[index - 1];
                                                Timestamp
                                                    previousTransactionDate =
                                                    previousTransaction
                                                        .transactionDate;
                                                DateTime
                                                    previousTransactionDateTime =
                                                    previousTransactionDate
                                                        .toDate();
                                                previousTransactionDateOnly =
                                                    DateTime(
                                                  previousTransactionDateTime
                                                      .year,
                                                  previousTransactionDateTime
                                                      .month,
                                                  previousTransactionDateTime
                                                      .day,
                                                );
                                              }

                                              bool showDateHeader =
                                                  (previousTransactionDateOnly ==
                                                          null ||
                                                      !transactionDateOnly
                                                          .isAtSameMomentAs(
                                                              previousTransactionDateOnly));

                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  showDateHeader
                                                      ? Column(
                                                          children: [
                                                            Text(
                                                              DateFormat(
                                                                      'dd MMM yyyy')
                                                                  .format(transactionDateOnly
                                                                      .toLocal()),
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    kcTextColor,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        )
                                                      : Container(),
                                                  HomeTransactionRow(
                                                    walletType:
                                                        transactionDetails
                                                            .walletType,
                                                    amount: transactionDetails
                                                        .totalPaid
                                                        .toString(),
                                                    type: transactionDetails
                                                        .transactionType,
                                                    transactionDetails:
                                                        transactionDetails,
                                                    buttonText:
                                                        transactionDetails
                                                            .status,
                                                    btc: transactionDetails
                                                        .totalGoldBought
                                                        .toString(),
                                                    image:
                                                        'assets/images/transaction.png',
                                                    //  viewModel.image(transactionDetails)

                                                    // ,
                                                    imageBack: kcYellowBright,
                                                    btcColor: kcYellowBright,
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => TransactiondetailsView(
                                                                profitOrLoss: calculateProfitLoss(
                                                                    buyRate:
                                                                        transactionDetails
                                                                            .buyGoldRate,
                                                                    conversionRate:
                                                                        conversionFactor,
                                                                    gramsBought:
                                                                        transactionDetails
                                                                            .totalGoldBought,
                                                                    sellRate:
                                                                        currentGoldRate),
                                                                transactionDetails:
                                                                    transactionDetails)),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    const SizedBox(
                                              height: 0,
                                            ),
                                          ),
                                        )
                                  : viewModel.isSelected == 'Bank' &&
                                          viewModel.bankTransactions.isEmpty
                                      ? SizedBox(
                                          // color: Colors.white,
                                          height: size.height * 0.55,
                                          child: Center(
                                            child: viewModel.isBusy
                                                ? const CircularProgressIndicator()
                                                : const Text(
                                                    'No Transactions For Bank Yet',
                                                    style: TextStyle(
                                                        color: kcTextColor)),
                                          ),
                                        )
                                      : viewModel.isSelected == 'Crypto' &&
                                              viewModel
                                                  .cryptoTransactions.isEmpty
                                          ? SizedBox(
                                              // color: Colors.white,
                                              height: size.height * 0.55,
                                              child: Center(
                                                child: viewModel.isBusy
                                                    ? const CircularProgressIndicator()
                                                    : const Text(
                                                        'No Transactions For Crypto Yet',
                                                        style: TextStyle(
                                                            color:
                                                                kcTextColor)),
                                              ),
                                            )
                                          : viewModel.isSelected == 'Card' &&
                                                  viewModel
                                                      .cardTransactions.isEmpty
                                              ? SizedBox(
                                                  // color: Colors.white,
                                                  height: size.height * 0.55,
                                                  child: Center(
                                                    child: viewModel.isBusy
                                                        ? const CircularProgressIndicator()
                                                        : const Text(
                                                            'No Transactions For Card Yet',
                                                            style: TextStyle(
                                                                color:
                                                                    kcTextColor)),
                                                  ),
                                                )
                                              : viewModel.isBusy
                                                  ? SizedBox(
                                                      // color: Colors.white,
                                                      height:
                                                          size.height * 0.55,
                                                      child: const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    )
                                                  : Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 0),
                                                      // color: Colors.white,
                                                      child: ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        dragStartBehavior:
                                                            DragStartBehavior
                                                                .down,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount: viewModel
                                                                    .isSelected ==
                                                                'Card'
                                                            ? viewModel
                                                                .cardTransactions
                                                                .length
                                                            : viewModel.isSelected ==
                                                                    'Crypto'
                                                                ? viewModel
                                                                    .cryptoTransactions
                                                                    .length
                                                                : viewModel
                                                                    .bankTransactions
                                                                    .length,
                                                        itemBuilder:
                                                            ((context, index) {
                                                          return HomeTransactionRow(
                                                            // profileLoss: viewModel.,
                                                            transactionDetails: viewModel
                                                                        .isSelected ==
                                                                    'Card'
                                                                ? viewModel
                                                                        .cardTransactions[
                                                                    index]
                                                                : viewModel.isSelected ==
                                                                        'Crypto'
                                                                    ? viewModel
                                                                            .cryptoTransactions[
                                                                        index]
                                                                    : viewModel
                                                                            .bankTransactions[
                                                                        index],
                                                            //  viewModel.cryptoTransactions[index],
                                                            buttonText: viewModel
                                                                        .isSelected ==
                                                                    'Card'
                                                                ? viewModel
                                                                    .cardTransactions[
                                                                        index]
                                                                    .status
                                                                : viewModel.isSelected ==
                                                                        'Crypto'
                                                                    ? viewModel
                                                                        .cryptoTransactions[
                                                                            index]
                                                                        .status
                                                                    : viewModel
                                                                        .bankTransactions[
                                                                            index]
                                                                        .status,
                                                            // viewModel.cryptoTransactions[index].status,
                                                            btc: viewModel
                                                                        .isSelected ==
                                                                    'Card'
                                                                ? viewModel
                                                                    .cardTransactions[
                                                                        index]
                                                                    .totalGoldBought
                                                                    .toString()
                                                                : viewModel.isSelected ==
                                                                        'Crypto'
                                                                    ? viewModel
                                                                        .cryptoTransactions[
                                                                            index]
                                                                        .totalGoldBought
                                                                        .toString()
                                                                    : viewModel
                                                                        .bankTransactions[
                                                                            index]
                                                                        .totalGoldBought
                                                                        .toString(),

                                                            //  viewModel
                                                            //     .cryptoTransactions[index].totalGoldBought
                                                            //     .toString(),
                                                            image: masterCard,
                                                            imageBack:
                                                                kcYellowBright,
                                                            btcColor:
                                                                kcYellowBright,
                                                            onTap: () {},
                                                          );
                                                        }),
                                                      ),
                                                    ),
                              // const SizedBox(
                              //     child: Text('Coming Soon'),
                              //   ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // ),
    );
  }

  Widget transactionTypes(
      {required BuildContext context,
      required Size size,
      required String buttonText,
      required VoidCallback onTap,
      required TransactionHistoryScreenViewModel model}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: size.height * 0.05,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: kcContainerColor
              .withOpacity(model.isSelected == buttonText ? 0.2 : 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(color: kcTextColor, fontSize: 13),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(TransactionHistoryScreenViewModel viewModel) {
    viewModel.onViewModelReady();
    super.onViewModelReady(viewModel);
  }

  @override
  TransactionHistoryScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactionHistoryScreenViewModel();
}
