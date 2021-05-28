import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/common/constants/svg_constants.dart';
import 'package:interview_review_app/common/utils/widget_utils.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/thankyou_screen/thank_you_screen_constants.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';

class Thankyou extends StatelessWidget {
  final String rating;

  Thankyou({@required this.rating});

  @override
  Scaffold build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: LayoutConstants.dimen_0.h,
              child: Container(
                margin: EdgeInsets.all(LayoutConstants.dimen_8),
                child: getSvgPicture(
                    assetName: SvgConstants.thanks,
                    size: Size(LayoutConstants.designWidth.w,
                        LayoutConstants.dimen_770.h)),
              ),
            ),
            Positioned(
              top: LayoutConstants.dimen_308.h,
              child: Column(
                children: [
                  Container(
                    height: LayoutConstants.dimen_60.h,
                    width: LayoutConstants.designWidth.w,
                    padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.dimen_24.w),
                    child: Text(
                      ThankyouConstants.thankyou,
                      style: Theme.of(context).textTheme.boldHeadline1,
                    ),
                  ),
                  SizedBox(height: LayoutConstants.dimen_24.h),
                  Container(
                    height: LayoutConstants.dimen_120.h,
                    width: LayoutConstants.designWidth.w,
                    padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.dimen_24.w),
                    child: RichText(
                      text: TextSpan(
                          text: ThankyouConstants.message,
                          style: ThemeText.headline5,
                          children: <TextSpan>[
                            TextSpan(
                                text: '$rating!',
                                style:
                                    Theme.of(context).textTheme.mediumHeadline5)
                          ]),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: LayoutConstants.dimen_45.h,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstants.dimen_24.w),
                child: TextButton(
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, RouteConstants.home),
                  child: Text(
                    ThankyouConstants.buttonText,
                    style: Theme.of(context).textTheme.backButton,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
