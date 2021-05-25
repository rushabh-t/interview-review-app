import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/common/constants/svg_constants.dart';
import 'package:interview_review_app/common/utils/widget_utils.dart';
import 'package:interview_review_app/domain/entities/rating_card_entity.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';

abstract class RatingScreenConstants {
  RatingScreenConstants._();
  static List<RatingCardEntity> ratingCardEntityList = [
    RatingCardEntity(
      color: AppColor.cobalt,
      borderColor: AppColor.cobalt38,
      icon: getSvgPicture(
        assetName: SvgConstants.awesomeIcon,
        size: Size(LayoutConstants.dimen_50.w, LayoutConstants.dimen_50.h),
      ),
      text1: "Awesome",
      text2: "Best interviewer. Ever!",
    ),
    RatingCardEntity(
      color: AppColor.darkSpringGreen,
      borderColor: AppColor.darkSpringGreen38,
      icon: getSvgPicture(
        assetName: SvgConstants.goodIcon,
        size: Size(LayoutConstants.dimen_50.w, LayoutConstants.dimen_50.h),
      ),
      text1: "Good",
      text2: "Nice person. Really Nice!",
    ),
    RatingCardEntity(
      color: AppColor.regalBlue,
      borderColor: AppColor.regalBlue38,
      icon: getSvgPicture(
        assetName: SvgConstants.neutralIcon,
        size: Size(LayoutConstants.dimen_50.w, LayoutConstants.dimen_50.h),
      ),
      text1: "Neutral",
      text2: "Ummm…Okay. I guess!",
    ),
    RatingCardEntity(
      color: AppColor.harleyDavidsonOrange,
      borderColor: AppColor.harleyDavidsonOrange38,
      icon: getSvgPicture(
        assetName: SvgConstants.badIcon,
        size: Size(LayoutConstants.dimen_50.w, LayoutConstants.dimen_50.h),
      ),
      text1: "Bad",
      text2: "Needs to Improve! A LOT!",
    ),
  ];

  static const String selectRating = "SELECT YOUR RATING";
  static const String backButton = "GO BACK";
  static const String chooseRating = "How would you rate your interviewer(s)?";
  static const String nextButton = "NEXT";
}
