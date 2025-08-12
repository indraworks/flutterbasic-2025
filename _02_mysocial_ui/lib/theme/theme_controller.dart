import 'package:flutter/material.dart';

//controller global yg ringan tuk atur theme

class ThemeController {
  ThemeController._();
  static final ThemeController instance = ThemeController._();

  // Nilai awal
  final ValueNotifier<ThemeMode> mode = ValueNotifier<ThemeMode>(
    ThemeMode.system,
  );
  //getter
  bool get isDark => mode.value == ThemeMode.dark; //defaultnya dark

  void toggle() {
    mode.value = isDark ? ThemeMode.light : ThemeMode.dark; // THEME
  }

  //setter
  void set(ThemeMode newMode) {
    mode.value = newMode; // THEME
  }
}
