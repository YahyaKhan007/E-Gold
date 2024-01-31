import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/widgets/customMetalBuyButton.dart';
import 'package:flutter/material.dart';

class BuyGoldenContainer extends StatelessWidget {
  final String amount;
  final String balance;
  VoidCallback onBack;
  final String margin;

  final bool goldCheck;
  final VoidCallback checkGoldFunc;
  final VoidCallback? checkSilverFunc;
   BuyGoldenContainer({
    super.key,
    required this.goldCheck,
    required this.onBack,
    required this.balance,
    required this.margin,
    required this.checkGoldFunc,
    this.checkSilverFunc,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kcYellowBright),
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ],
          ),

          goldCheck
              ? const Text(
                  'I‘m Buying Gold',
                  style: TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const Text(
                  'I‘m Buying Silver',
                  style: TextStyle(
                    color: Color(0xFF1F1F1F),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

          // const Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Text(
            '  $amount',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontSize: 45.87,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Balance:  $balance ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.87,
              letterSpacing: 1.28,
            ),
          ),
          Text(
            'Magrin:  $margin  ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13.87,
              letterSpacing: 1.28,
            ),
          ),
        ],
      ),
    );
  }
}
