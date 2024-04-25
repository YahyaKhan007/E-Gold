import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPaymentMethod extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final VoidCallback onPressed;
  bool icon;
  AddPaymentMethod({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.onPressed,
    this.icon = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          color: kcProfitColor,
          shape: BoxShape.circle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade300,
          //     blurRadius: 2,
          //     offset: const Offset(1, 1),
          //   )
          // ],
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
            color: kcTextColor,
          ),
        ),
      ),
      title: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: kcTextColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: icon
          ? IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: kcTextColor,
                size: 18,
              ),
            )
          : Container(),
    );
  }
}
