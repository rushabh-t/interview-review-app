import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget.normal(
    BuildContext context, {
    @required String title,
    List<Widget> actions,
  }) : super(
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          actions: actions,
        );

  AppBarWidget.image(
    BuildContext context, {
    @required Widget title,
    List<Widget> actions,
  }) : super(
          centerTitle: true,
          title: title,
          actions: actions,
        );
}
