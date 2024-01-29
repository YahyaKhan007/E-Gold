import 'package:flutter/material.dart';

class HomeMetalButton extends StatelessWidget {
  final Color containerColor;
  final String title;
  VoidCallback? onTap;
  HomeMetalButton({
    super.key,
    required this.containerColor,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
