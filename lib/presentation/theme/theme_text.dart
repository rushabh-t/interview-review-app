import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';

import 'app_color.dart';

abstract class ThemeText {
  ThemeText._();

  static const String defaultFontFamily = 'Roboto';

  static final TextStyle headline1 = TextStyle(
    fontSize: 40.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle headline2 = TextStyle(
    fontSize: 36.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle headline3 = TextStyle(
    fontSize: 32.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle headline4 = TextStyle(
    fontSize: 28.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle headline5 = TextStyle(
    fontSize: 24.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
    height: 1.3,
  );

  static final TextStyle headline6 = TextStyle(
    fontSize: 20.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle bodyText1 = TextStyle(
    fontSize: 18.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle bodyText2 = TextStyle(
    fontSize: 16.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle subtitle1 = TextStyle(
    fontSize: 17.sp,
    color: AppColor.regalBlue,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle subtitle2 = TextStyle(
    fontSize: 13.sp,
    color: AppColor.regalBlue83,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle caption = TextStyle(
    fontSize: 14.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle overline = TextStyle(
    fontSize: 10.sp,
    color: AppColor.primaryTextColor,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static final TextStyle button = caption.copyWith(
    letterSpacing: 1.0,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
  );

  static final TextStyle buttonEnabled = caption.copyWith(
    letterSpacing: 1.0,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
    color: AppColor.white,
  );

  static TextTheme defaultTextTheme() => TextTheme(
        headline1: ThemeText.headline1,
        headline2: ThemeText.headline2,
        headline3: ThemeText.headline3,
        headline4: ThemeText.headline4,
        headline5: ThemeText.headline5,
        headline6: ThemeText.headline6,
        subtitle1: ThemeText.subtitle1,
        subtitle2: ThemeText.subtitle2,
        bodyText1: ThemeText.bodyText1,
        bodyText2: ThemeText.bodyText2,
        caption: ThemeText.caption,
        button: ThemeText.button,
        overline: ThemeText.overline,
      );
}

extension CustomTextTheme on TextTheme {
  TextStyle get boldHeadline1 => headline1.copyWith(
        fontWeight: FontWeight.bold,
        height: 1.6,
      );

  TextStyle get mediumHeadline5 => headline5.copyWith(
        fontWeight: FontWeight.w500,
        height: 1.6,
      );

  TextStyle get overline2 => overline.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: 12.sp,
        color: AppColor.regalBlue.withOpacity(0.38),
      );

  TextStyle get buttonText => subtitle2.copyWith(
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      );

  TextStyle get changeText => subtitle2.copyWith(
        color: AppColor.white,
        decoration: TextDecoration.underline,
      );

  TextStyle get commentText => button.copyWith(
        decoration: TextDecoration.underline,
      );

  TextStyle get backButton => button.copyWith(
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        color: AppColor.regalBlue,
      );

  TextStyle get nonButton => caption.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get appBarTitle => subtitle1.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle get boldSubtitle1 => subtitle1.copyWith(
        fontWeight: FontWeight.w900,
      );

  TextStyle get text1 => bodyText1.copyWith(
        color: AppColor.regalBlue,
      );

  TextStyle get text2 => caption.copyWith(
        color: AppColor.regalBlue87,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  TextStyle get selectedText1 => bodyText1.copyWith(
        color: AppColor.white,
      );

  TextStyle get selectedText2 => caption.copyWith(
        color: AppColor.white,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  TextStyle get selectedSubtitle1 => subtitle1.copyWith(
        color: AppColor.primaryColor,
      );
  TextStyle get headline6 => headline6.copyWith(
        fontSize: 22.sp,
      );

  TextStyle get reviewHint => headline5.copyWith(
        fontWeight: FontWeight.w300,
      );

  TextStyle get chipSelected => bodyText2.copyWith(
        color: AppColor.jewel,
      );

  TextStyle get searchText => caption.copyWith(
        height: 1.4,
        color: AppColor.regalBlue38,
        fontWeight: FontWeight.w400,
      );
}
