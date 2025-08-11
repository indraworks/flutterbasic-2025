import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
      ),
      textTheme: TextTheme(
        //descrepancies di flutter 3.0 headline6 diganti headlineSmall
        headlineSmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.0,
          fontSize: 20,
        ),
        //others styles
        displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300),
        displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w300),
        displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
        headlineLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
