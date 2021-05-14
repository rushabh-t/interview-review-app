import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/common/constants/svg_constants.dart';
import 'package:interview_review_app/common/utils/widget_utils.dart';

class Thankyou extends StatelessWidget {
  @override
  Scaffold build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: -421.w,
              child: getSvgPicture(
                  assetName: SvgConstants.thankYou,
                  size: Size(927.w, LayoutConstants.designHeight.h)),
            ),
          ],
        ),
      );
}
