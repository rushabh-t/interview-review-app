import 'package:flutter/material.dart';
import 'package:interview_review_app/presentation/journey/home/home_screen.dart';
import 'package:interview_review_app/presentation/journey/rating_screen/rating_screen.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';

abstract class CommonRoutes {
  CommonRoutes._();

  static Map<String, WidgetBuilder> all() => {
        RouteConstants.home: (context) => Home(),
        RouteConstants.rating: (context) => RatingScreen(),
      };
}
