import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

import '../common/ui_helpers.dart';

class AccountPageRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const AccountPageRow({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: kcTextColor,
              fontSize: screenHeight(context) * 0.02,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: screenHeight(context) * 0.02,
              color: kcTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
