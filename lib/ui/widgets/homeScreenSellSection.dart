import 'package:e_gold/ui/common/app_colors.dart';
import 'package:e_gold/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SellSectionHome extends StatelessWidget {
  VoidCallback? onTap;
  SellSectionHome({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                color: Colors.lightBlue.shade300,
                blurRadius: 5,
                offset: const Offset(2, 4),
                spreadRadius: 0,
              ),
            ],
            color: kcLightButtonBackground,
            shape: const OvalBorder(),
          ),
        ),
        horizontalSpaceSmall,
        const Expanded(
          child: SizedBox(
            width: 124,
            height: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$500 (5gm)',
                  style: TextStyle(
                    color: kcButtonBackground,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '+18.33% today',
                  style: TextStyle(
                    color: kcLightButtonBackground,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        horizontalSpaceSmall,
        InkWell(
          onTap: onTap,
          child: Container(
            width: 120,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: kcButtonBackground,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  offset: Offset(2, 4),
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sell',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
