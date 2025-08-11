import 'package:flutter/material.dart';
import 'package:socio_network_dpindra/utils/responsive.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
        bodySmall: TextStyle(fontSize: 12),
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
        bodySmall: TextStyle(fontSize: 12),
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
      ),
    );
  }

  //Comon textStyle
  static TextStyle titleStyle(BuildContext context) {
    return Theme.of(
      context,
    ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle subtitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey);
  }

  //COmon padding
  static EdgeInsets defaultPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: Responsive.isMobile(context) ? 16 : 24,
      vertical: 16,
    );
  }
}
