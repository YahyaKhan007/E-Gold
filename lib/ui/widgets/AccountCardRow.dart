import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: TextStyle(
            color: const Color(0xFF1F1F1F),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            color: const Color(0xFF1F1F1F),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
