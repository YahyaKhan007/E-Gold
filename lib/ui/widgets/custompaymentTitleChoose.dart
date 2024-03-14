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
    required this.balance,
    required this.margin,
    required this.title,
    required this.text,
    required this.onPressed,
    this.icon = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: [
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
              offset: Offset(1, 1),
            )
          ],
          // image: DecorationImage(
          //   image: AssetImage(
          //     image,
          //   ),
          // )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            image,
            color: Colors.black,
          ),
        ),
      ),

      title: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            'Balance:  $balance',
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            'Margin: $margin',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),

      trailing: icon
          ? IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: kcButtonBackground,
              ),
            )
          : Container(),
    );
  }
}
