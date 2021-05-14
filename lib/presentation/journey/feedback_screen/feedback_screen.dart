import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/feedback_screen_constants.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';
import 'package:interview_review_app/presentation/widgets/scrollable_chip_widget.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  List chipList = FeedbackScreenConstants().chipList;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.white,
        body: Stack(
          children: [
            Positioned(
              top: 50.h,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: LayoutConstants.designWidth.w,
                    height: 192.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18.r),
                          bottomRight: Radius.circular(18.r)),
                      color: AppColor.solitude83,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
                          child: Text(
                            "YOU HAVE RATED YOUR INTERVIEWER",
                            style: Theme.of(context).textTheme.overline2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: LayoutConstants.dimen_32.h,
                  ),
                  Container(
                    height: 66.h,
                    width: LayoutConstants.designWidth.w,
                    padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.dimen_24.w),
                    child: Text(
                      "What made the interviewers awesome?",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                    height: LayoutConstants.dimen_24.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstants.dimen_24.w,
                    ),
                    width: LayoutConstants.designWidth.w,
                    child: ScrollableChipWidget(
                      chipList: chipList,
                      onTap: onTap,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 72.h,
              child: Container(
                height: 48.h,
                width: LayoutConstants.designWidth.w,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addCommentButton(),
                    submitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  TextButton addCommentButton() => TextButton.icon(
        onPressed: () => Navigator.pushNamed(context, RouteConstants.comment),
        icon: Icon(
          Icons.chat_bubble_outline,
          color: AppColor.regalBlue,
        ),
        label: Text(
          "ADD COMMENT",
          style: Theme.of(context).textTheme.button,
        ),
      );

  ElevatedButton submitButton() => ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, RouteConstants.thank),
        icon: Text(
          "SUBMIT",
          style: ThemeText.buttonEnabled,
        ),
        label: Icon(
          Icons.check,
          color: AppColor.white,
          size: LayoutConstants.dimen_24,
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColor.salem,
          padding: EdgeInsets.symmetric(
            vertical: LayoutConstants.dimen_15,
            horizontal: LayoutConstants.dimen_16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutConstants.dimen_8),
          ),
        ),
      );

  void onTap(chipList) {}
}
