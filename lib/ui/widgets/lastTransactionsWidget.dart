import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'customHomeTransactionRow.dart';
import 'homeScreenSellSection.dart';

class LastTransactionsWidget extends StatefulWidget {
  final Function()? onTapSell, onTapSeeAll;
  final String transactionTypeImage;

  const LastTransactionsWidget(
      {super.key,
      this.onTapSell,
      this.onTapSeeAll,
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
            itemCount: 7,
            itemBuilder: (context, index) {
              return HomeTransactionRow(
                buttonColor: kcSuccessGreen,
                buttonText: 'Completed',
                btc: '+0.001',
                image: widget.transactionTypeImage,
                imageBack: kcYellowBright,
                btcColor: kcYellowBright,
                onTap: () {},
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
