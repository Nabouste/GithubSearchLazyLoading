import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF406bb4);
  static const positiveColor = Color(0xFF32BA95);
  static const negativeColor = Color(0xFFEF8784);
  static const disableColor = Color(0xffe1e1e1);
  static const bodyColor = Color(0xff7c7c7c);
  static const boxColor = Color(0xFF2699FB);
  static const searchBarColor = Color(0xFFF2F2F2);
  static ThemeData light(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: boxColor,
      errorColor: negativeColor,
      disabledColor: disableColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: GoogleFonts.nunitoTextTheme(
              Theme.of(context).textTheme).copyWith(headline6:Theme.of(context).textTheme.headline6.apply(color: bodyColor),
          ),
          iconTheme: IconThemeData(color: bodyColor),
          actionsIconTheme: IconThemeData(color: positiveColor),
          elevation: 0.0),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: GoogleFonts.nunito().fontFamily,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:  GoogleFonts.nunito(
            color:  const Color(0xff7c7c7c),
            fontWeight: FontWeight.w400,
            fontStyle:  FontStyle.normal,
            fontSize: 16.0
        ),
        contentPadding: const EdgeInsets.all(13),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
      textTheme: GoogleFonts.nunitoTextTheme(textTheme).apply(bodyColor: bodyColor).copyWith(
        headline5: GoogleFonts.nunitoTextTheme(textTheme).headline5.apply(color: primaryColor, fontWeightDelta: 6),
      ),
    );
  }

}
