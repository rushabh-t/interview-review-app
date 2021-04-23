import 'package:flutter/material.dart';

abstract class AppColor {
  AppColor._();

  // Generic Colors
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFFABABAB);

  // Style Guide Colors
  static const Color logan = Color(0xFF999EB3);
  static const Color regalBlue = Color(0xFF17214D);
  static const Color solitude = Color(0xFFEEEFF5);
  static const Color slateGray = Color(0xFF6C728C);
  static const Color salem = Color(0xFF13873B);
  static const Color jewel = Color(0x610A6F2D);

  //Color Alpha Variant
  static const Color _regalBlue38 = Color(0x6117214D);
  static const Color _regalBlue08 = Color(0x1417214D);

  // Application Colors
  static const Color primaryColor = Color(0xFF2291F3);
  static const Color secondaryColor = Color(0xFFE9EBF2);

  static const Color primaryTextColor = regalBlue;
  static const Color primaryColorHint38 = _regalBlue38;
  static const Color primaryColorShadow08 = _regalBlue08;

  static const Color primaryColorDisabled = slateGray;
  static const Color buttonEnabledBackground = salem;
  static const Color buttonEnabledShadow = jewel;
  static const Color buttonDisabledBackground = logan;

  static const Color scaffoldBackgroundColor = secondaryColor;
  static const Color cardForegroundColor = solitude;

  static Color primaryColor25 = primaryColor.withOpacity(0.25);
  static Color divider = transparent;
  static Color regalBlue83 = regalBlue.withOpacity(0.83);
}
