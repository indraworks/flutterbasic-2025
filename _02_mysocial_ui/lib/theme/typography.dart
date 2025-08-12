import 'package:flutter/material.dart';

class AppTypography {
  //  teks konsisten dgn skala
  static const double xs = 11;
  static const double sm = 13;
  static const double base = 14;
  static const double md = 16;
  static const double lg = 18;
  static const double xl = 22;
  static const double display = 28;

  //kossistnensi utk fontweight permasing2 ukuran
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // TextTheme
  static TextTheme textTheme(Color onBg) => TextTheme(
    titleLarge: TextStyle(fontSize: display, fontWeight: bold, color: onBg),
    titleMedium: TextStyle(fontSize: xl, fontWeight: bold, color: onBg),
    titleSmall: TextStyle(fontSize: lg, fontWeight: semibold, color: onBg),
    bodyLarge: TextStyle(fontSize: md, fontWeight: regular, color: onBg),
    bodyMedium: TextStyle(fontSize: base, fontWeight: regular, color: onBg),
    bodySmall: TextStyle(fontSize: sm, fontWeight: regular, color: onBg),
    labelLarge: TextStyle(fontSize: md, fontWeight: semibold, color: onBg),
  );
}
