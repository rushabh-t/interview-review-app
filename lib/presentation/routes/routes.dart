import 'package:flutter/material.dart';

import 'package:interview_review_app/presentation/routes/common_routes.dart';

abstract class Routes {
  Routes._();

  static Map<String, WidgetBuilder> getAll() => {
        ...CommonRoutes.all(),
      };
}
