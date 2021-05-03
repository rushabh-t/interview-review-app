import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_review_app/di/injector_config.dart';
import 'package:interview_review_app/presentation/app/app.dart';
import 'package:pedantic/pedantic.dart';

void main() {
  InjectorConfig.setup();
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(SystemChrome.setEnabledSystemUIOverlays([]));

  runZonedGuarded(
    () => runApp(
      App(),
    ),
    (error, stacktrace) => log(
      "Something error occurred",
      error: error,
      stackTrace: stacktrace,
    ),
  );
}
