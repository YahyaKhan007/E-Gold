import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:flutter/material.dart';

class CryptoGoldenContainer extends StatelessWidget {
  const CryptoGoldenContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 16,
        bottom: 20,
      ),
      decoration: ShapeDecoration(
        color: kcYellowBright,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              width: 74,
              height: 49,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: kcYellowBright,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 8,
                    offset: Offset(2, 4),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 6,
                    offset: Offset(-2, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Image.asset(crypto),
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Mastercard ending in 1213',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
