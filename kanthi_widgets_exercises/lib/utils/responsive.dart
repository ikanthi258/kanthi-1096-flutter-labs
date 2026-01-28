import 'package:flutter/material.dart';

class Responsive {
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return EdgeInsets.all(16.0);
    }
    return EdgeInsets.all(8.0);
  }

  static EdgeInsets getGridPadding(BuildContext context) {
    if (isPortrait(context)) {
      return EdgeInsets.all(20.0);
    }
    return EdgeInsets.all(40.0);
  }

  static double getGridChildRatio(BuildContext context) {
    if (isPortrait(context)) {
      return 2.5;
    }
    return 8;
  }
}
