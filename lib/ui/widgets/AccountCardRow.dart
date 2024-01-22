import 'package:flutter/material.dart';

class AccountCardRow extends StatelessWidget {
  final String text1;
  final String text2;
  const AccountCardRow({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          text2,
          style: const TextStyle(
            color: Color(0xFF1F1F1F),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
