
import 'package:flutter/material.dart';


class AppTheme {

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0
      ),
      textTheme: TextTheme(
         headline
      )

    )
  }


}


