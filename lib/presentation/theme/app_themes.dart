import 'package:flutter/material.dart';

import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';

abstract class AppThemes {
  AppThemes._();

  static ThemeData defaultTheme() => ThemeData(
        primaryColor: AppColor.primaryColor,
        toggleableActiveColor: AppColor.primaryColor,
        scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
        unselectedWidgetColor: AppColor.white,
        colorScheme: ColorScheme.light(
          primary: AppColor.primaryColor,
          onPrimary: AppColor.primaryColor,
          primaryVariant: AppColor.primaryColor25,
          secondary: AppColor.secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: AppColor.transparent,
          elevation: LayoutConstants.dimen_0,
          actionsIconTheme: const IconThemeData(
            color: AppColor.black,
          ),
          textTheme: ThemeText.defaultTextTheme(),
        ),
        fontFamily: ThemeText.defaultFontFamily,
        primaryTextTheme: ThemeText.defaultTextTheme(),
        textTheme: ThemeText.defaultTextTheme(),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColor.primaryColor,
          disabledColor: AppColor.logan,
        ),
      );
}
