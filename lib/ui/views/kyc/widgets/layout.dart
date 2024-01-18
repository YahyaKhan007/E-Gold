import 'package:flutter/material.dart';

import '../../../common/ui_helpers.dart';

class KycLayoutWidget extends StatefulWidget {
  final List<Widget> children;
  final Function()? onPressed;
  final String title, subtitle;
  final Widget? trailing;

  const KycLayoutWidget(
      {required this.onPressed,
      required this.children,
      required this.title,
      required this.subtitle,
      super.key,
      this.trailing});

  @override
  State<KycLayoutWidget> createState() => KycLayoutWidgetFrontState();
}

class KycLayoutWidgetFrontState extends State<KycLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context) * 0.85,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.75),
                  blurRadius: 2.5,
                  spreadRadius: 1.25),
            ],
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          margin:
              const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 24),
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
              verticalSpaceTiny,
              Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w300,
                    ),
                softWrap: true,
              ),
              Column(
                children: widget.children,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(36),
                  shape: const StadiumBorder(),
                ),
                onPressed: widget.onPressed,
                child: const Text("Submit"),
              ),
              horizontalSpaceTiny
            ],
          ),
        ),
      ),
    );
  }
}
