import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/di/injector.dart';
import 'package:interview_review_app/domain/entities/chip_entity.dart';
import 'package:interview_review_app/domain/entities/rating_card_entity.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/bloc/feedback_bloc.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/feedback_screen_constants.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/rating_screen_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';
import 'package:interview_review_app/presentation/widgets/scrollable_chip_widget.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/bloc/feedback_state.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/bloc/feedback_event.dart';

import 'comment_screen.dart';
import 'thank_you_screen.dart';

class FeedBack extends StatefulWidget {
  final int index;

  FeedBack({Key key, @required this.index}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  FeedbackBloc feedbackBloc;

  List<ChipEntity> chipList = FeedbackScreenConstants.chipList;
  List<RatingCardEntity> ratingCard =
      RatingScreenConstants.ratingCardEntityList;

  @override
  void initState() {
    super.initState();
    feedbackBloc = Injector.resolve<FeedbackBloc>()..add(LoadChipEvent());
  }

  @override
  void dispose() {
    feedbackBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.white,
        body: BlocBuilder<FeedbackBloc, FeedbackState>(
            cubit: feedbackBloc, builder: (context, state) => getStack(state)),
      );

  Stack getStack(FeedbackState state) => Stack(
        children: [
          Positioned(
            top: 0.h,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: LayoutConstants.designWidth.w,
                  height: 242.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18.r),
                        bottomRight: Radius.circular(18.r)),
                    color: AppColor.solitude,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(24.w, 74.h, 24.w, 24.h),
                        child: Text(
                          "YOU HAVE RATED YOUR INTERVIEWER",
                          style: Theme.of(context).textTheme.overline2,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          height: 90.h,
                          width: LayoutConstants.designWidth.w,
                          margin: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 24.h),
                          child: ratingCard
                              .map(
                                (value) => Card(
                                  elevation: LayoutConstants.dimen_14,
                                  color: value.color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        LayoutConstants.dimen_8.r),
                                    side: BorderSide(color: value.borderColor),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 56.h,
                                        width: 56.h,
                                        child: value.icon,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 21.h,
                                            width: 123.w,
                                            child: Text(
                                              '${value.text1}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .selectedText1,
                                            ),
                                          ),
                                          Container(
                                            height: 21.h,
                                            width: 160.w,
                                            child: Text(
                                              '${value.text2}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .selectedText2,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              'CHANGE',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .changeText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .elementAt(widget.index)),
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
                    "What made the interviewers ${ratingCard.map((value) => value.text1).elementAt(widget.index)}?",
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
                      chipList: state.chipList,
                      onTap: (chipEntity) => feedbackBloc
                          .add(ChipTapEvent(chipList.indexOf(chipEntity))),
                    ))
              ],
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
                  addCommentButton(),
                  submitButton(),
                ],
              ),
            ),
          ),
        ],
      );

  TextButton addCommentButton() => TextButton.icon(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Comment(
                    rating:
                        '${ratingCard.map((value) => value.text1).elementAt(widget.index)}'))),
        icon: Icon(
          Icons.chat_bubble_outline,
          color: AppColor.regalBlue,
        ),
        label: Text(
          "ADD COMMENT",
          style: Theme.of(context).textTheme.commentText,
        ),
      );

  ElevatedButton submitButton() => ElevatedButton.icon(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Thankyou(
                    rating:
                        '${ratingCard.map((value) => value.text1).elementAt(widget.index)}'))),
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
}
