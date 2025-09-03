import 'package:flutter/material.dart';
import 'package:perplexity_clone/core/resources/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData primaryTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  // unselectedWidgetColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white), backgroundColor: AppColors.footerGrey),
  cardTheme: const CardThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.footerGrey,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.background,
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  colorScheme: ColorScheme(
    tertiaryContainer: AppColors.background,
    brightness: Brightness.light,
    primary: AppColors.background,
    onPrimary: Colors.white,
    secondary: AppColors.searchBar,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.white,
    onSurface: Colors.black,
    shadow: Colors.white.withAlpha(229),
  ),
  //primarySwatch: Colors.deepPurple,
  textTheme: TextTheme(
    //For title and subtitle used in card and container
    titleLarge: GoogleFonts.lato(
      fontSize: 25,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    //For Main labels like Courses, Insights, etc on HomeScreen
    labelLarge: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    //For Button
    labelMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    //For Bottom Nav Text
    labelSmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  unselectedWidgetColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white),
    backgroundColor: AppColors.background,
  ),
  cardTheme: const CardThemeData(
    color: AppColors.cardColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.blueAccent,
    selectionColor: Colors.blueGrey,
  ),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: AppColors.background),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    minWidth: double.infinity,
    height: 60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.background,
    elevation: 2,
  ),
  colorScheme: ColorScheme(
    tertiaryContainer: Colors.white,
    brightness: Brightness.dark,
    primary: AppColors.background,
    onPrimary: Colors.white,
    secondary: AppColors.cardColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.red,
    surface: AppColors.cardColor,
    onSurface: AppColors.background,
    shadow: AppColors.background.withAlpha(229),
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.ibmPlexMono(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayLarge: GoogleFonts.ibmPlexMono(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      height: 1.2,
      letterSpacing: -0.5,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);
