import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/di/injector.dart';
import 'package:interview_review_app/domain/entities/chip_entity.dart';
import 'package:interview_review_app/domain/entities/rating_card_entity.dart';
import 'package:interview_review_app/presentation/journey/feedback/bloc/feedback_bloc.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/feedback_screen/feedback_screen_constants.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/widgets/rating_screen_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';
import 'package:interview_review_app/presentation/widgets/scrollable_chip_widget.dart';
import 'package:interview_review_app/presentation/journey/feedback/bloc/feedback_state.dart';
import 'package:interview_review_app/presentation/journey/feedback/bloc/feedback_event.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/comment_screen/comment_screen.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/thankyou_screen/thank_you_screen.dart';

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
            top: LayoutConstants.dimen_0.h,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: LayoutConstants.designWidth.w,
                  height: LayoutConstants.dimen_242.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(LayoutConstants.dimen_18.r),
                        bottomRight:
                            Radius.circular(LayoutConstants.dimen_18.r)),
                    color: AppColor.solitude,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            LayoutConstants.dimen_24.w,
                            LayoutConstants.dimen_74.h,
                            LayoutConstants.dimen_24.w,
                            LayoutConstants.dimen_24.h),
                        child: Text(
                          FeedbackScreenConstants.ratingText,
                          style: Theme.of(context).textTheme.overline2,
                        ),
                      ),
                      SizedBox(
                        height: LayoutConstants.dimen_15.h,
                      ),
                      Container(
                          height: LayoutConstants.dimen_90.h,
                          width: LayoutConstants.designWidth.w,
                          margin: EdgeInsets.fromLTRB(
                              LayoutConstants.dimen_24.w,
                              LayoutConstants.dimen_0.h,
                              LayoutConstants.dimen_24.w,
                              LayoutConstants.dimen_24.h),
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
                                        height: LayoutConstants.dimen_40.h,
                                        width: LayoutConstants.dimen_40.w,
                                        child: value.icon,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: LayoutConstants.dimen_21.h,
                                            width: LayoutConstants.dimen_123.w,
                                            child: Text(
                                              '${value.text1}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .selectedText1,
                                            ),
                                          ),
                                          Container(
                                            height: LayoutConstants.dimen_21.h,
                                            width: LayoutConstants.dimen_160.w,
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
                                              FeedbackScreenConstants
                                                  .changeRating,
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
                  height: LayoutConstants.dimen_66.h,
                  width: LayoutConstants.designWidth.w,
                  padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstants.dimen_24.w),
                  child: Text(
                    FeedbackScreenConstants.qualities +
                        "${ratingCard.map((value) => value.text1).elementAt(widget.index)}?",
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
            bottom: LayoutConstants.dimen_72.h,
            child: Container(
              height: LayoutConstants.dimen_48.h,
              width: LayoutConstants.designWidth.w,
              padding:
                  EdgeInsets.symmetric(horizontal: LayoutConstants.dimen_24.w),
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
          FeedbackScreenConstants.comment,
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
          FeedbackScreenConstants.submit,
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
            vertical: LayoutConstants.dimen_15.h,
            horizontal: LayoutConstants.dimen_16.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutConstants.dimen_8.r),
          ),
        ),
      );
}
