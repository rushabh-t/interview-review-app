import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:interview_review_app/common/constants/app_constants.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/presentation/journey/splash/splash_screen.dart';
import 'package:interview_review_app/presentation/routes/routes.dart';
import 'package:interview_review_app/presentation/theme/app_themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(
          LayoutConstants.designWidth,
          LayoutConstants.designHeight,
        ),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: AppThemes.defaultTheme(),
          home: SplashScreen(),
          routes: Routes.getAll(),
        ),
      );
}
