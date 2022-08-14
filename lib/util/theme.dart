import 'package:flutter/material.dart';
import 'package:kavishala_flutter/util/constants.dart';


class BrandTheme {
  static final NormalTheme = ThemeData(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor : kPrimaryColor,
      // textTheme: TextTheme(
      //   headline1: GoogleFonts.lato(fontSize: 20),
      //   bodyText1: GoogleFonts.lato(fontSize: 18),
      //   bodyText2: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
      //   subtitle1: GoogleFonts.lato(fontSize: 14),
      //   button: GoogleFonts.lato(fontSize: 14),
      // ),
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch);
}
