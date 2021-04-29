import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/common/constants/svg_constants.dart';
import 'package:interview_review_app/common/utils/widget_utils.dart';
import 'package:interview_review_app/di/injector.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_bloc.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_event.dart';
import 'package:interview_review_app/presentation/journey/home/bloc/home_state.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc;
  int userCount = 0;

  @override
  void initState() {
    super.initState();
    homeBloc = Injector.resolve<HomeBloc>()..add(LoadListEvent());
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Scaffold build(BuildContext context) => Scaffold(
        body: Container(
          child: getStack(),
        ),
      );

  Stack getStack() => Stack(
        children: <Widget>[
          //1st element stack
          Positioned(
            top: 51.h,
            left: 384,
            child: getSvgPicture(
              assetName: SvgConstants.logoWaterMark,
              size: Size(37.w, 170.h),
            ),
          ),

          Positioned(
            top: 41.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              height: 642.h,
              width: LayoutConstants.designWidth.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: LayoutConstants.designWidth.w,
                    child: Text(
                      "Interviewers",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.boldHeadline1,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    height: 48.h,
                    width: LayoutConstants.designWidth.w,
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    height: 14.h,
                    width: LayoutConstants.designWidth.w,
                    child: Text(
                      "${homeBloc.state.count} ADDED",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.overline2,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: LayoutConstants.designWidth.w,
                      child: getList(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //2nd Element stack
          Positioned(
            top: 683.h,
            child: Container(
              width: LayoutConstants.designWidth.w,
              height: 96.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColor.white.withOpacity(0),
                    AppColor.solitude.withOpacity(0),
                    AppColor.solitude.withOpacity(1),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 134.w,
                    height: 48.h,
                    padding: const EdgeInsets.only(right: 24),
                    child: ElevatedButton.icon(
                      onPressed: null,
                      label: Icon(Icons.navigate_next),
                      icon: Text("NEXT"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  BlocBuilder getList() {
    return BlocBuilder(
      cubit: homeBloc,
      builder: (context, state) {
        if (state is ListLoadingState) {
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else if (state is ListLoadedState) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: state.userData.results.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 24.h,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  state.userData.results[index].name.first +
                      ' ' +
                      state.userData.results[index].name.last,
                  style: ThemeText.subtitle1,
                ),
                subtitle: Text(
                  state.userData.results[index].cell,
                  style: ThemeText.subtitle2,
                ),
                trailing: getAddRemoveButton(),
              );
            },
          );
        } else {
          return Text(
            "No Data",
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  BlocBuilder getAddRemoveButton() {
    return BlocBuilder(
      cubit: homeBloc,
      builder: (context, state) {
        if (state is UserAddedState) {
          return TextButton(
            child: Text(
              "REMOVE",
              style: Theme.of(context).textTheme.buttonText,
            ),
            onPressed: onRemovePressed,
          );
        } else if (state is UserRemovedState) {
          return TextButton(
            child: Text(
              "ADD",
              style: Theme.of(context).textTheme.buttonText,
            ),
            onPressed: onAddPressed,
          );
        } else
          return TextButton(
            child: Text(
              "ADD",
              style: Theme.of(context).textTheme.buttonText,
            ),
            onPressed: onAddPressed,
          );
      },
    );
  }

  void onRemovePressed() {
    //userCount = state.count;
    homeBloc.add(UserRemoveEvent(userCount));
  }

  void onAddPressed() {
    homeBloc.add(UserAddEvent(userCount));
  }
}
