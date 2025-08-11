import 'dart:ffi';

import 'package:flutter/widgets.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) {
    //jika size < 600
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }
}
