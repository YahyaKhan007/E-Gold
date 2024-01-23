import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String labelText;
  TextInputType? keyboardType;
  double? width;
  int? maxLenght;
  CustomTextField({
    this.width,
    this.keyboardType,
    required this.title,
    required this.labelText,
    this.maxLenght,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          width: width,
          height: 44,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: kcLightText),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Center(
            child: TextField(
              maxLength: maxLenght,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                fillColor: kcBackgroundColor,
                contentPadding: const EdgeInsets.all(10),
                counterText: '',
                label: Text(
                  labelText,
                  style: const TextStyle(
                    color: kcLightText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0.16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
