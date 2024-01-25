import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/widgets/customMetalBuyButton.dart';
import 'package:flutter/material.dart';

class BuyGoldenContainer extends StatelessWidget {
  final String amount;
  final bool goldCheck;
  final VoidCallback checkGoldFunc;
  final VoidCallback checkSilverFunc;
  const BuyGoldenContainer({
    super.key,
    required this.goldCheck,
    required this.checkGoldFunc,
    required this.checkSilverFunc,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kcYellowBright),
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * .5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MetalBuyButton(
                onTap: checkGoldFunc,
                title: 'Gold',
                color: kcGoldYellow,
              ),
              const SizedBox(
                width: 30,
              ),
              MetalBuyButton(
                onTap: checkSilverFunc,
                title: 'Silver',
                color: kcSilverLight,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
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
            height: MediaQuery.of(context).size.height * .1,
          ),
          Text(
            '\$$amount',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 63.87,
              fontWeight: FontWeight.w600,
              letterSpacing: -1.28,
            ),
          ),
        ],
      ),
    );
  }
}
