import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;
  const BottomNavIcon({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(image),
          onPressed: onPressed,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFFF5B118),
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
      ],
    );
  }
}
