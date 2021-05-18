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
  static const Color jewel = Color(0xFF0C6F2E);
  static const Color cobalt = Color(0xFF0036CC);
  static const Color darkSpringGreen = Color(0xFF208342);
  static const Color harleyDavidsonOrange = Color(0xFFD83C16);

  //Color Alpha Variant
  static const Color regalBlue38 = Color(0x6117214D);
  static const Color regalBlue87 = Color(0xDE17214D);
  static const Color _regalBlue08 = Color(0x1417214D);
  static const Color cobalt38 = Color(0x610036CC);
  static const Color darkSpringGreen38 = Color(0x61208342);
  static const Color harleyDavidsonOrange38 = Color(0x61D83C16);
  static const Color jewel10 = Color(0x1A0C6F2E);

  // Application Colors
  static const Color primaryColor = Color(0xFF2291F3);
  static const Color secondaryColor = Color(0xFFE9EBF2);
  static const Color secondaryColor83 = Color(0xD3E9EBF2);
  static const Color secondaryColor00 = Color(0x00E9EBF2);

  static const Color primaryTextColor = regalBlue;
  static const Color primaryColorHint38 = regalBlue38;
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
  static Color solitude83 = solitude.withOpacity(0.83);
}
