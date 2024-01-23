import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/app_images.dart';
import 'package:flutter/material.dart';

class AddCryptoGoldenContainer1 extends StatelessWidget {
  const AddCryptoGoldenContainer1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
      height: MediaQuery.of(context).size.height * .3,
      decoration: ShapeDecoration(
        color: kcYellowBright,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.56),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '2.2 USDT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            '2.20752 USD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'Network BSC (BEP-20)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Image.asset(
                exclamation,
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'You pay network fee',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
