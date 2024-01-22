import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/common/app_colors.dart';

ThemeData themeData(BuildContext context) {
  var outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(32.0),
  );
  return ThemeData(
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(size: 20.0),
        toolbarHeight: 60.0,
        elevation: 0.0,
        backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: kcBackgroundColor,
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
      bodyColor: Colors.black,
      fontSizeFactor: 0.80,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(14.0),
            foregroundColor: Colors.white,
            minimumSize: const Size(180, 56),
            backgroundColor: const Color(0xffF5B119),
            textStyle:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: kcDarkGreyColor,
          ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedErrorBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      errorBorder: outlineInputBorder,
      isDense: true,
    ),
  );
}
