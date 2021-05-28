import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/common/constants/svg_constants.dart';
import 'package:interview_review_app/common/utils/widget_utils.dart';
import 'package:interview_review_app/di/injector.dart';
import 'package:interview_review_app/domain/entities/rating_card_entity.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/feedback_screen/feedback_screen.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/bloc/rating_bloc.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/bloc/rating_state.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/bloc/rating_event.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/widgets/rating_screen_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  RatingBloc ratingBloc;
  List<RatingCardEntity> ratingCardEntityList;

  @override
  void initState() {
    super.initState();
    ratingBloc = Injector.resolve<RatingBloc>()..add(LoadRatingEvent());
  }

  @override
  void dispose() {
    ratingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<RatingBloc, RatingState>(
          cubit: ratingBloc,
          builder: (context, state) => getStack(state),
        ),
      );

  Stack getStack(RatingState state) => Stack(
        children: <Widget>[
          Positioned(
            top: LayoutConstants.dimen_51.h,
            left: LayoutConstants.dimen_384,
            child: getSvgPicture(
              assetName: SvgConstants.logoWaterMark,
              size:
                  Size(LayoutConstants.dimen_37.w, LayoutConstants.dimen_170.h),
            ),
          ),
          Positioned(
            top: LayoutConstants.dimen_41.h,
            child: Container(
              width: LayoutConstants.designWidth.w,
              padding: EdgeInsets.symmetric(
                horizontal: LayoutConstants.dimen_24.w,
              ),
              child: Column(
                children: [
                  getTitle(),
                  SizedBox(
                    height: LayoutConstants.dimen_16.h,
                  ),
                  Container(
                    width: LayoutConstants.designWidth.w,
                    child: Text(
                      RatingScreenConstants.selectRating,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.overline2,
                    ),
                  ),
                  SizedBox(
                      height: (Platform.isAndroid)
                          ? LayoutConstants.dimen_16.h
                          : LayoutConstants.dimen_0.h),
                  getRatings(state),
                  SizedBox(
                      height: (Platform.isAndroid)
                          ? LayoutConstants.dimen_16.h
                          : LayoutConstants.dimen_0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      goBackButton(),
                      nextButton(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );

  TextButton goBackButton() => TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          RatingScreenConstants.backButton,
          style: Theme.of(context).textTheme.backButton,
        ),
      );

  Container getTitle() => Container(
        height: LayoutConstants.dimen_180.h,
        width: LayoutConstants.designWidth.w,
        child: Text(
          RatingScreenConstants.chooseRating,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.boldHeadline1,
        ),
      );

  GridView getRatings(RatingState state) => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:
              (LayoutConstants.dimen_155.w / LayoutConstants.dimen_184.h),
          crossAxisCount: LayoutConstants.dimen_2.toInt(),
          crossAxisSpacing: LayoutConstants.dimen_17.w,
          mainAxisSpacing: LayoutConstants.dimen_16.h,
        ),
        itemCount: state.ratingCardEntityList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => ratingBloc.add(OnTapEvent(index)),
            child: state.ratingCardEntityList
                .map(
                  (value) => Card(
                    elevation:
                        value.isSelected == true && state is RatingSelected
                            ? LayoutConstants.dimen_5
                            : LayoutConstants.dimen_0,
                    color: value.isSelected == true && state is RatingSelected
                        ? value.color
                        : AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(LayoutConstants.dimen_8),
                      side: BorderSide(color: value.borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              LayoutConstants.dimen_16.w,
                              LayoutConstants.dimen_16.h,
                              LayoutConstants.dimen_0,
                              LayoutConstants.dimen_0),
                          child: value.icon,
                        ),
                        SizedBox(
                          height: LayoutConstants.dimen_24,
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: LayoutConstants.dimen_16.w),
                          child: Text(
                            "${value.text1}",
                            style: value.isSelected == true &&
                                    state is RatingSelected
                                ? Theme.of(context).textTheme.selectedText1
                                : Theme.of(context).textTheme.text1,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: LayoutConstants.dimen_9,
                        ),
                        Container(
                          height: LayoutConstants.dimen_42.h,
                          width: LayoutConstants.dimen_123.w,
                          margin:
                              EdgeInsets.only(left: LayoutConstants.dimen_16.w),
                          child: Text(
                            "${value.text2}",
                            style: value.isSelected == true &&
                                    state is RatingSelected
                                ? Theme.of(context).textTheme.selectedText2
                                : Theme.of(context).textTheme.text2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .elementAt(index),
          );
        },
      );

  ElevatedButton nextButton() => ratingBloc.state is RatingSelected
      ? ElevatedButton.icon(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FeedBack(index: ratingBloc.state.index))),
          label: Icon(
            Icons.navigate_next,
            size: LayoutConstants.dimen_24,
            color: AppColor.white,
          ),
          icon: Text(
            RatingScreenConstants.nextButton,
            style: ThemeText.buttonEnabled,
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
        )
      : ElevatedButton.icon(
          onPressed: null,
          label: Icon(
            Icons.navigate_next,
            size: LayoutConstants.dimen_24,
          ),
          icon: Text(
            RatingScreenConstants.nextButton,
            style: ThemeText.button,
          ),
          style: ElevatedButton.styleFrom(
            primary: AppColor.logan,
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
