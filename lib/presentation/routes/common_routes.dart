import 'package:flutter/material.dart';
import 'package:interview_review_app/presentation/journey/home/home.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';

abstract class CommonRoutes {
  CommonRoutes._();

  static Map<String, WidgetBuilder> all() => {
        RouteConstants.home: (context) => Home(),
      };
}
