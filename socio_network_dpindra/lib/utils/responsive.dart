import 'package:flutter/material.dart';

class Responsive {
  //mobile
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  //tablet
  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  //desktop
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  //responsice FontSIze
  static double resposiveFontSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 14;
    } else if (width < 1200) {
      return 16;
    } else {
      return 18;
    }
  }

  //Responsive Padding
  static double responsivePadding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 8; //mobile
    } else if (width < 1200) {
      return 16; //tablet
    } else {
      return 24; //desktop
    }
  }

  //responsive image Size
  static double responsiveImageSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 40;
    } else if (width < 1200) {
      return 60;
    } else {
      return 80;
    }
  }
}
