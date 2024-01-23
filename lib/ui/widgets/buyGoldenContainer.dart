import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/widgets/customMetalBuyButton.dart';
import 'package:flutter/material.dart';

class BuyGoldenContainer extends StatelessWidget {
  final bool goldCheck;
  final VoidCallback checkGoldFunc;
  final VoidCallback checkSilverFunc;
  const BuyGoldenContainer({
    super.key,
    required this.goldCheck,
    required this.checkGoldFunc,
    required this.checkSilverFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kcYellowBright),
      height: MediaQuery.of(context).size.height * .28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
