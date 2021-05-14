import 'package:flutter/material.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/comment_screen.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/feedback_screen.dart';
import 'package:interview_review_app/presentation/journey/feedback_screen/thank_you_screen.dart';
import 'package:interview_review_app/presentation/journey/home/home_screen.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';

abstract class CommonRoutes {
  CommonRoutes._();

  static Map<String, WidgetBuilder> all() => {
        RouteConstants.home: (context) => Home(),
        RouteConstants.feedback: (context) => FeedBack(),
        RouteConstants.comment: (context) => Comment(),
        RouteConstants.thank: (context) => Thankyou()
      };
}
