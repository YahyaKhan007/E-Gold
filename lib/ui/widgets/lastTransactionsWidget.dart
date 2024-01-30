import 'package:e_gold/models/transactionDetails.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:e_gold/ui/views/transactiondetails/transactiondetails_view.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'customHomeTransactionRow.dart';
import 'homeScreenSellSection.dart';

class LastTransactionsWidget extends StatefulWidget {
  final VoidCallback? onTapSell, onTapSeeAll;
  final String transactionTypeImage;
  final List<TransactionDetails> transactions;

  const LastTransactionsWidget(
      {super.key,
      this.onTapSell,
      this.onTapSeeAll,
      required this.transactions,
      required this.transactionTypeImage});

  @override
  LastTransactionsWidgetState createState() => LastTransactionsWidgetState();
}

class LastTransactionsWidgetState extends State<LastTransactionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          verticalSpaceSmall,
          SellSectionHome(
            onTap: widget.onTapSell,
          ),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Last Transactions',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: widget.onTapSeeAll,
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: kcYellowBright,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
          verticalSpaceSmall,
          Expanded(
              child: ListView.separated(
            itemCount: widget.transactions.length,
            itemBuilder: (context, index) {
              TransactionDetails transaction = widget.transactions[index];

              return HomeTransactionRow(
                transactionDetails: transaction,
                buttonColor: kcSuccessGreen,
                buttonText: transaction.status,
                btc: transaction.totalGoldBought.toString(),
                image: widget.transactionTypeImage,
                imageBack: kcYellowBright,
                btcColor: kcYellowBright,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactiondetailsView(
                        transactionDetails: transaction,
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                verticalSpaceSmall,
          ))
        ],
      ),
    );
  }
}
