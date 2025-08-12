import 'package:flutter/widgets.dart';
import 'constants.dart';

class Responsive {
  static double width(BuildContext c) => MediaQuery.of(c).size.width; // RESP
  static double height(BuildContext c) => MediaQuery.of(c).size.height; // RESP

  static bool isMobile(BuildContext c) =>
      width(c) <= Layout.bpMobileMax; // RESP
  static bool isTablet(BuildContext c) =>
      width(c) > Layout.bpMobileMax && width(c) <= Layout.bpTabletMax; // RESP
  static bool isDesktop(BuildContext c) =>
      width(c) > Layout.bpTabletMax; // RESP

  // Helper padding agar  horizontal adaptif
  static EdgeInsets pagePadding(BuildContext c) {
    if (isDesktop(c)) return const EdgeInsets.symmetric(horizontal: 32); // RESP
    if (isTablet(c)) return const EdgeInsets.symmetric(horizontal: 24); // RESP
    return const EdgeInsets.symmetric(horizontal: 16); // RESP
  }

  // Constrainer utk max width desktop agar rapi
  static Widget constrain({required Widget child}) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: Layout.contentMaxWidth,
      ), // RESP
      child: child,
    ),
  );
}
