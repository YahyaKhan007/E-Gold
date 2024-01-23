import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class TransactionScreenContainerRow extends StatelessWidget {
  final String text1;
  final String text2;
  const TransactionScreenContainerRow({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: kcLightText,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
