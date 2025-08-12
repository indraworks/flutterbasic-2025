import 'package:flutter/material.dart';

//ini utk responsive design smua ke page2

class Responsive {
  static bool isMobile(BuildContext context) => //kalau gak pakai {return }
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) {
    return (MediaQuery.of(context).size.width >= 650 &&
        MediaQuery.of(context).size.width < 1200);
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
}
