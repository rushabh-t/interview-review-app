import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/app_constants.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/common/constants/svg_constants.dart';
import 'package:interview_review_app/common/utils/widget_utils.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    _timer = new Timer(
      AppConstants.splashDuration,
      () => Navigator.pushReplacementNamed(context, RouteConstants.home),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColor.primaryColor,
      child: getSvgPicture(
          assetName: SvgConstants.logo,
          size: Size(
              LayoutConstants.splashWidth.w, LayoutConstants.splashHeight.h)),
    );
  }
}
