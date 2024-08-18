import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taske_bloc_converte/config/colors.dart';

int index=0;

ThemeData lightTheme() => ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.blue.withOpacity(0.5),
    selectionHandleColor: Colors.blue.withOpacity(0.5),
    selectionColor: Colors.blue.withOpacity(0.5),
  ),
  checkboxTheme: CheckboxThemeData(
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    fillColor: MaterialStateColor.resolveWith(
          (states) {
        if (states.contains(MaterialState.selected)) {
          return primaryGreen;
        } else {
          return Colors.white;
        }
      },
    ),
  ),
  brightness: Brightness.light,
  pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(
        ),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
  dividerTheme: DividerThemeData(
    indent: 0.0,
    endIndent: 0.0,
    thickness: 1.0,
    space: 0.5,
    color: const Color(0xFFB9BCCC).withOpacity(0.3),
  ),
  hintColor: Colors.grey[400],
  disabledColor: Colors.grey[300],

  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w500,
        fontSize: 56,
        fontFamily: "Cairo"),
    titleLarge: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: "Cairo"),
    headlineLarge: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: "Cairo"),
    displayMedium: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: "Cairo"),
    titleMedium: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: "Cairo"),
    headlineMedium: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: "Cairo"),
    bodySmall: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w600,
        fontSize: 16,
        fontFamily: "Cairo"),
    bodyMedium: TextStyle(
        color: Color(0xff12131A),
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: "Cairo"),
  ),
  primaryTextTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
  ),
  highlightColor: Colors.grey[100]!.withOpacity(0.4),
  splashColor: Colors.transparent,
  primaryColor: primaryGreen,
  scaffoldBackgroundColor: const Color(0xfff9f9f9),
  dividerColor: Colors.grey[300],
  fontFamily: "Cairo",
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
        color: darkGreen,
        border: Border.all(color: darkGreen),
        borderRadius: BorderRadius.circular(10)),
    labelColor: Colors.white,
    labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelColor: const Color(0xff12131A),
    unselectedLabelStyle: const TextStyle(fontFamily: "Cairo"),
    labelStyle: const TextStyle(
        fontFamily: "Cairo", fontWeight: FontWeight.w600, fontSize: 16),
  ),
  inputDecorationTheme: InputDecorationTheme(
  ),

  colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.white
  ),
  appBarTheme: AppBarTheme(
      centerTitle: false,
      color: primaryGreen,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      elevation: 0.5,
      actionsIconTheme: const IconThemeData(color: Colors.white)),
);
