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
  final VoidCallback checkSilverFunc;
  BuyGoldenContainer({
    super.key,
    required this.goldCheck,
    required this.onBack,
    required this.balance,
    required this.margin,
    required this.checkGoldFunc,
    required this.checkSilverFunc,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kcYellowBright),
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: checkGoldFunc,
                child: Center(
                  child: Container(
                    width: 100,
                    height: 48,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: ShapeDecoration(
                      color: kcLightYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3FF5B119),
                          blurRadius: 8,
                          offset: Offset(2, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: checkSilverFunc,
                child: Center(
                  child: Container(
                    width: 100,
                    height: 48,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: ShapeDecoration(
                      color: kcSilver,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3FF5B119),
                          blurRadius: 8,
                          offset: Offset(2, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Margin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'I‘m Buying Gold',
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              goldCheck
                  ? const Text(
                      '(Balance)',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const Text(
                      '(Margin)',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ],
          ),
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
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13.87,
              letterSpacing: 1.28,
            ),
          ),
          Text(
            'Magrin:  $margin  ',
            style: const TextStyle(
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
