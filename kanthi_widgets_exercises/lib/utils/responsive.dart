import 'package:flutter/material.dart';

class Responsive {
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static EdgeInsets getGridPadding(BuildContext context) {
    if (isPortrait(context)) {
      return const EdgeInsets.all(20.0);
    }
    return const EdgeInsets.all(40.0);
  }

  static double getGridChildRatio(BuildContext context) {
    if (isPortrait(context)) {
      return 2.5;
    }
    return 8;
  }

  static bool isMobile(BuildContext context) =>
      isMobileFromWidth(MediaQuery.of(context).size.width);
  static bool isMobileFromWidth(double width) => width <= 600;
  static bool isTabletFromWidth(double width) => width > 600 && width <= 900;
  static bool isDesktopFromWidth(double width) => width > 900;

  // ---------- Columns based on width ----------
  static int getColumnCount(double width) {
    if (isMobileFromWidth(width)) return 1;
    if (isTabletFromWidth(width)) return 2;
    return 3; // desktop
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16.0);
    }
    return const EdgeInsets.all(8);
  }
}
