import 'package:flutter/material.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/comment_screen/comment_screen.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/feedback_screen/feedback_screen.dart';
import 'package:interview_review_app/presentation/journey/feedback/widgets/thankyou_screen/thank_you_screen.dart';
import 'package:interview_review_app/presentation/journey/home/widgets/home_screen.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/widgets/rating_screen.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';

abstract class CommonRoutes {
  CommonRoutes._();

  static Map<String, WidgetBuilder> all() => {
        RouteConstants.home: (context) => Home(),
        RouteConstants.rating: (context) => RatingScreen(),
        RouteConstants.feedback: (context) => FeedBack(index: 0),
        RouteConstants.comment: (context) => Comment(rating: ''),
        RouteConstants.thank: (context) => Thankyou(rating: ''),
      };
}
