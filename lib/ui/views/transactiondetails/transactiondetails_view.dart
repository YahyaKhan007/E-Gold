import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/app_widgets.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'transactiondetails_viewmodel.dart';

class TransactiondetailsView extends StackedView<TransactiondetailsViewModel> {
  final TransactionDetails transactionDetails;
  const TransactiondetailsView({Key? key, required this.transactionDetails})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TransactiondetailsViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: kAppBar(
            context: context,
            title: const Text('Transaction Details'),
            onButtonPressed: viewModel.onBack,
            backgroundColor: Colors.amber),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 140,
              width: screenWidth(context),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Color(0xffFCE8BA),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              bottomLeft: Radius.circular(24))),
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Holding",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                              "${transactionDetails.totalPaid} + ${transactionDetails.totalBonus}")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Color(0xffF9D075),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              bottomRight: Radius.circular(24))),
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Profit",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const Text("\$100"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  List<String> values = [
                    transactionDetails.status,
                    transactionDetails.totalPaid.toString(),
                    transactionDetails.totalBonus.toString(),
                    transactionDetails.totalGoldBought.toString(),
                    transactionDetails.withdrawMethod,
                    viewModel.formattedDate(transactionDetails.transactionDate),
                    transactionDetails.transactionId,
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
                    visualDensity: VisualDensity.compact,
                    titleTextStyle: Theme.of(context).textTheme.titleMedium,
                    leadingAndTrailingTextStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: const Color.fromARGB(255, 177, 167, 167),
                              fontWeight: FontWeight.w400,
                            ),
                    title: Text(names[index]),
                    trailing: Text(values[index]),
                  );
                },
                itemCount: 7,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 2.0);
                },
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Sell')),
            verticalSpaceLarge
          ],
        ),
      ),
    );
  }

  @override
  TransactiondetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TransactiondetailsViewModel();
}
