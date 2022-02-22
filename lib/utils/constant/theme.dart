import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/constant/colors.dart';

class NewsAppTheme {
// 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline6: GoogleFonts.openSans(
        fontSize: 24.0, fontWeight: FontWeight.w900, color: Colors.black87),
  );
// 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static ThemeData lightThemeData() {
    return ThemeData(
      textTheme: lightTextTheme,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme:
          const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
      iconTheme: const IconThemeData(color: kContentColorLightTheme),
      colorScheme: const ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          error: kErrorColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
        showUnselectedLabels: true,
      ),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      textTheme: darkTextTheme,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kContentColorLightTheme,
      appBarTheme: const AppBarTheme(
          backgroundColor: kContentColorLightTheme, elevation: 0),
      iconTheme: const IconThemeData(color: kContentColorDarkTheme),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kContentColorLightTheme,
        selectedItemColor: Colors.white70,
        unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: kPrimaryColor),
        showUnselectedLabels: true,
      ),
    );
  }
}
