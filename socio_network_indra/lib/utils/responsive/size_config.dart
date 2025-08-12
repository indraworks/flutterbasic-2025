import 'package:flutter/material.dart';
//ini utk hitungukuran /acuan  masing2 responsivenya baik vertical dan horizontal !

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  static double safeBlockHorizontal(BuildContext context) {
    return MediaQuery.of(context).size.width / 100;
  }

  static double safeBlockVertical(BuildContext context) {
    return MediaQuery.of(context).size.height / 100;
  }
}
