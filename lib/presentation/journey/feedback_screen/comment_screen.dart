import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';

import 'thank_you_screen.dart';

class Comment extends StatefulWidget {
  final String rating;

  Comment({Key key, @required this.rating}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  int charCount = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 74.h,
              child: Container(
                height: LayoutConstants.designHeight.h,
                width: LayoutConstants.designWidth.w,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "COMMENTS (OPTIONAL)",
                          style: Theme.of(context).textTheme.overline2,
                        ),
                        Text(
                          "$charCount/240",
                          style: Theme.of(context).textTheme.overline2,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      width: LayoutConstants.designWidth.w,
                      child: reviewField(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 72.h,
              child: Container(
                height: 48.h,
                width: LayoutConstants.designWidth.w,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    skipButton(),
                    submitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  TextField reviewField() => TextField(
        autofocus: true,
        autocorrect: false,
        maxLength: 240,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        cursorColor: AppColor.regalBlue,
        cursorWidth: 2.w,
        cursorHeight: 36.sp,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 10,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
          labelText: "Write Your Review",
          labelStyle: Theme.of(context).textTheme.reviewHint,
        ),
        onChanged: (String value) {
          setState(() {
            charCount = value.length;
          });
        },
      );

  ElevatedButton submitButton() => ElevatedButton.icon(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Thankyou(rating: '${widget.rating}'),
          ),
        ),
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

  TextButton skipButton() => TextButton(
        child: Text(
          "SKIP",
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: () => Navigator.pop(context),
      );
}
