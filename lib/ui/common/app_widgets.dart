import 'package:flutter/material.dart';

PreferredSize kAppBar({required VoidCallback onButtonPressed}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: onButtonPressed,
      ),
    ),
  );
}
