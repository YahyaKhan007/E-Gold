import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/app_strings.dart';

class BuyGoldenContainer extends StatelessWidget {
  final String amount;
  final String grams;
  final String balance;
  final String margin;
  final VoidCallback onBack;
  final bool goldCheck;
  final VoidCallback checkGoldFunc;
  final VoidCallback checkSilverFunc;

  const BuyGoldenContainer({
    Key? key,
    required this.goldCheck,
    required this.onBack,
    required this.balance,
    required this.checkGoldFunc,
    required this.checkSilverFunc,
    required this.amount,
    required this.margin,
    required this.grams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFB3E5FC), // Light blue
            Color(0xFFE1F5FE), // Lighter blue
          ],
        ),
      ),
      height: screenHeight(context) * 0.5,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: onBack,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: kcButtonBackground,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: checkGoldFunc,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: screenHeight(context) * 0.06,
                    decoration: ShapeDecoration(
                      color: goldCheck ? kcLightButtonBackground : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // shadows: const [
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     blurRadius: 5,
                      //     offset: Offset(2, 4),
                      //     spreadRadius: 0,
                      //   ),
                      // ],
                    ),
                    child: Center(
                      child: Text(
                        'Balance',
                        style: TextStyle(
                          color: goldCheck ? Colors.white : Colors.black,
                          fontSize: screenHeight(context) * 0.02,
                          fontWeight: FontWeight.w600,
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
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: screenHeight(context) * 0.06,
                    decoration: ShapeDecoration(
                      color: goldCheck ? Colors.white : kcLightButtonBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // shadows: const [
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     blurRadius: 5,
                      //     offset: Offset(2, 4),
                      //     spreadRadius: 0,
                      //   ),
                      // ],
                    ),
                    child: Center(
                      child: Text(
                        'Margin',
                        style: TextStyle(
                          color: goldCheck ? Colors.black : Colors.white,
                          fontSize: screenHeight(context) * 0.02,
                          fontWeight: FontWeight.w600,
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
            Center(
              child: Text(
                'Current Gold rate: AED $currentGoldRate',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Color(0xff2F4A64),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I\'m Buying Gold',
                  style: TextStyle(
                    color: kcTextColor,
                    fontSize: screenHeight(context) * 0.03,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // goldCheck
                //     ? const Text(
                //         '(Balance)',
                //         style: TextStyle(
                //           color: kcLightButtonBackground,
                //           fontSize: 10,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       )
                //     : const Text(
                //         '(Margin)',
                //         style: TextStyle(
                //             color: kcLightButtonBackground,
                //             fontSize: 10,
                //             fontWeight: FontWeight.w500,
                //             decorationStyle: TextDecorationStyle.wavy),
                //       ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            FittedBox(
              child: Text(
                '  $amount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kcTextColor,
                  // decoration: TextDecoration.underline,
                  fontSize: screenWidth(context) * 0.1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Visibility(
                visible: double.parse(grams) > 0 ? true : false,
                child: Text("You buy $grams grams of gold")),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Visibility(
              visible: goldCheck == true ? true : false,
              child: Text(
                'Balance:  $balance ',
                style: const TextStyle(
                  color: kcTextColor,
                  fontSize: 13.87,
                  letterSpacing: 1.28,
                ),
              ),
            ),
            Visibility(
              visible: goldCheck == true ? false : true,
              child: Text(
                'Magrin:  $margin  ',
                style: const TextStyle(
                  color: kcTextColor,
                  fontSize: 13.87,
                  letterSpacing: 1.28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
