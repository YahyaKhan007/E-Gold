import 'package:flutter/material.dart';

import 'ui_helpers.dart';

PreferredSize kAppBar({
  required BuildContext? context,
  required VoidCallback onButtonPressed,
  double? appBarHeight = 60.0,
  double? toolbarHeight = 60.0,
  Color? backgroundColor,
  Widget? title = const Text('title'),
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(appBarHeight!),
    child: AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: title,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: onButtonPressed,
      ),
    ),
  );
}

class KTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const KTextFormField({
    super.key,
    this.controller,
    required this.label,
    required this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        borderRadius: BorderRadius.circular(12.0));

    inputDecoration(String value) => InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          hintText: 'Enter $value',
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpaceTiny,
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        verticalSpaceTiny,
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: inputDecoration(label!),
          validator: validator,
        ),
        verticalSpaceTiny,
      ],
    );
  }
}

class KycLayoutWidget extends StatefulWidget {
  final List<Widget> children;
  VoidCallback onPressed;
  final String title, subtitle, buttonText;
  final Widget? trailing;

  KycLayoutWidget(
      {required this.onPressed,
      required this.children,
      required this.title,
      required this.subtitle,
      super.key,
      this.trailing,
      required this.buttonText});

  @override
  State<KycLayoutWidget> createState() => KycLayoutWidgetFrontState();
}

class KycLayoutWidgetFrontState extends State<KycLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.75,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.75),
            blurRadius: 2.5,
            spreadRadius: 1.25,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          verticalSpaceSmall,
          Text(
            widget.subtitle,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w300,
                ),
            softWrap: true,
          ),
          Expanded(
            child: ListView(
              children: widget.children,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(36),
                shape: const StadiumBorder(),
              ),
              onPressed: widget.onPressed,
              child: Text(widget.buttonText),
            ),
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }
}
