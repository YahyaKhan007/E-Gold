import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class choosePaymentTile extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final String margin;
  final String balance;
  final VoidCallback onPressed;
  bool icon;
  choosePaymentTile({
    super.key,
    required this.image,
    required this.balance,required this.margin,
    required this.title,
    required this.text,
    required this.onPressed,
    this.icon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const ShapeDecoration(
                color: Color(0xFFF0C777),
                shape: OvalBorder(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  image,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kcLightText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Balance:  ${balance}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kcLightText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Margin: ${margin}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kcLightText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ],
        ),
        icon
            ? IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                ),
              )
            : Container(),
      ],
    );
  }
}
