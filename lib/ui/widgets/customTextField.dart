import 'package:e_gold/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  String? labelText;
  TextInputType? keyboardType;
  double? width;
  int? maxLenght;
  String? Function(String?)? validator;
  final TextEditingController controller;
  bool? enabled;
  CustomTextField({
    this.width,
    this.keyboardType,
    required this.title,
    this.labelText = '',
    this.maxLenght,
    required this.controller,
    this.validator,
    this.enabled = true,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
          ),
          child: Center(
            child: TextFormField(
              enabled: enabled,
              validator: validator,
              controller: controller,
              maxLength: maxLenght,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                // fillColor: kcLightButtonBackground,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                contentPadding: const EdgeInsets.all(10),
                counterText: '',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0.16,
                ),
                label: Text(
                  labelText!,
                  style: const TextStyle(
                    color: Colors.black,
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
