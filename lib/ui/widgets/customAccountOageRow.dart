import 'package:flutter/material.dart';

class AccountPageRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const AccountPageRow({
    super.key,
    required this.text,
    required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 24,
          ),
        ),
      ],
    );
  }
}
