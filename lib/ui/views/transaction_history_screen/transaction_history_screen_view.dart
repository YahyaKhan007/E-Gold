import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/transactiondetails/transactiondetails_view.dart';
import 'package:e_gold/ui/widgets/customHomeTransactionRow.dart';
import 'package:intl/intl.dart';
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
      body: RefreshIndicator(
        onRefresh: viewModel.refreshData,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: screenHeight(context) - 276,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: viewModel.scrollController,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          controller: viewModel.scrollController,
                          itemCount: viewModel
                              .transactionService.transactionDetails!.length,
                          itemBuilder: (context, index) {
                            List<TransactionDetails> sortedList = viewModel
                                .transactionService.transactionDetails!
                                .toList(); // Copy the list to avoid modifying the original data
                            sortedList.sort((a, b) => b.transactionDate
                                .toDate()
                                .compareTo(a.transactionDate.toDate()));

                            TransactionDetails transaction = sortedList[index];

                            Timestamp transactionDate =
                                transaction.transactionDate;
                            DateTime transactionDateTime =
                                transactionDate.toDate();
                            DateTime transactionDateOnly = DateTime(
                              transactionDateTime.year,
                              transactionDateTime.month,
                              transactionDateTime.day,
                            );

                            DateTime? previousTransactionDateOnly;
                            if (index > 0) {
                              TransactionDetails previousTransaction =
                                  sortedList[index - 1];
                              Timestamp previousTransactionDate =
                                  previousTransaction.transactionDate;
                              DateTime previousTransactionDateTime =
                                  previousTransactionDate.toDate();
                              previousTransactionDateOnly = DateTime(
                                previousTransactionDateTime.year,
                                previousTransactionDateTime.month,
                                previousTransactionDateTime.day,
                              );
                            }

                            bool showDateHeader =
                                (previousTransactionDateOnly == null ||
                                    !transactionDateOnly.isAtSameMomentAs(
                                        previousTransactionDateOnly));

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                showDateHeader
                                    ? Column(
                                        children: [
                                          Text(
                                            DateFormat('dd MMM yyyy').format(
                                                transactionDateOnly.toLocal()),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    : Container(),
                                HomeTransactionRow(
                                  walletType: transaction.walletType,
                                  amount: transaction.totalPaid.toString(),
                                  type: transaction.transactionType,
                                  transactionDetails: transaction,
                                  buttonText: transaction.status,
                                  btc: transaction.totalGoldBought.toString(),
                                  image: viewModel.image(transaction),
                                  imageBack: kcYellowBright,
                                  btcColor: kcYellowBright,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TransactiondetailsView(
                                          transactionDetails: transaction,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              verticalSpaceSmall,
                        ),
                      ),
                    ],
                  ),
                ),
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
