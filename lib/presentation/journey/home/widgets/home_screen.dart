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
import 'package:interview_review_app/presentation/journey/home/widgets/home_screen_constants.dart';
import 'package:interview_review_app/presentation/routes/route_constants.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';
import 'package:interview_review_app/presentation/widgets/search_bar_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc;

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
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          cubit: homeBloc,
          builder: (context, state) => getStack(state),
        ),
      );

  Stack getStack(state) => Stack(
        children: <Widget>[
          //watermark
          Positioned(
            top: LayoutConstants.dimen_51.h,
            left: LayoutConstants.dimen_384,
            child: getSvgPicture(
              assetName: SvgConstants.logoWaterMark,
              size:
                  Size(LayoutConstants.dimen_37.w, LayoutConstants.dimen_170.h),
            ),
          ),

          //1st element of stack
          Positioned(
            top: LayoutConstants.dimen_41.h,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: LayoutConstants.dimen_24.w),
              height: LayoutConstants.designHeight.h,
              width: LayoutConstants.designWidth.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: LayoutConstants.designWidth.w,
                    child: Text(
                      HomeScreenConstants.title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.boldHeadline1,
                    ),
                  ),
                  SizedBox(height: LayoutConstants.dimen_16.h),
                  Container(
                    child: SearchbarWidget(
                      onChanged: (value) => homeBloc.add(SearchEvent(value)),
                      hintText: HomeScreenConstants.searchHint,
                    ),
                    height: LayoutConstants.dimen_48.h,
                    width: LayoutConstants.designWidth.w,
                  ),
                  SizedBox(height: LayoutConstants.dimen_32.h),
                  Container(
                    height: LayoutConstants.dimen_14.h,
                    width: LayoutConstants.designWidth.w,
                    child: Text(
                      "${state.count} " + HomeScreenConstants.countText,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.overline2,
                    ),
                  ),
                  SizedBox(height: LayoutConstants.dimen_16.h),
                  MediaQuery.removePadding(
                    context: context,
                    removeLeft: true,
                    removeRight: true,
                    child: Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.only(bottom: LayoutConstants.dimen_80.h),
                        width: LayoutConstants.designWidth.w,
                        child: getList(state),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //2nd Element stack
          Positioned(
            top: LayoutConstants.dimen_683.h,
            child: Container(
              width: LayoutConstants.designWidth.w,
              height: LayoutConstants.dimen_96.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  stops: [0.2, 0.5],
                  colors: [
                    AppColor.secondaryColor00,
                    AppColor.secondaryColor,
                  ],
                ),
              ),
              child: Container(
                color: AppColor.secondaryColor,
                width: LayoutConstants.dimen_120.w,
                margin: EdgeInsets.fromLTRB(
                    LayoutConstants.dimen_241.w,
                    LayoutConstants.dimen_24.h,
                    LayoutConstants.dimen_24.w,
                    LayoutConstants.dimen_24.h),
                child: getNextButton(),
              ),
            ),
          ),
        ],
      );

  Widget getList(HomeState state) {
    if (state is! ListLoadingState) {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: state.userData.results.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: LayoutConstants.dimen_24.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          return MediaQuery.removePadding(
            context: context,
            removeLeft: true,
            child: ListTile(
              title: Text(
                state.userData.results[index].fullName,
                style: (state.userData.results[index].isAdded == true)
                    ? Theme.of(context).textTheme.selectedSubtitle1
                    : ThemeText.subtitle1,
              ),
              subtitle: Text(
                state.userData.results[index].cell,
                style: ThemeText.subtitle2,
              ),
              trailing:
                  getAddRemoveButton(state.userData.results[index], index),
            ),
          );
        },
      );
    } else
      return Container();
  }

  TextButton getAddRemoveButton(item, index) {
    if (item.isAdded == true) {
      return TextButton(
        child: Text(
          HomeScreenConstants.removeButton,
          style: Theme.of(context).textTheme.buttonText,
        ),
        onPressed: () => onRemovePressed(index),
      );
    } else {
      return TextButton(
        child: Text(
          HomeScreenConstants.addButton,
          style: Theme.of(context).textTheme.buttonText,
        ),
        onPressed: () => onAddPressed(index),
      );
    }
  }

  void onRemovePressed(index) => homeBloc.add(UserRemoveEvent(index));

  void onAddPressed(index) => homeBloc.add(UserAddEvent(index));

  ElevatedButton getNextButton() {
    if (homeBloc.state.count <= 0) {
      return ElevatedButton.icon(
        onPressed: null,
        label: Icon(
          Icons.navigate_next,
          size: LayoutConstants.dimen_24,
        ),
        icon: Text(
          HomeScreenConstants.nextButton,
          style: ThemeText.button,
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColor.buttonDisabledBackground,
          padding: EdgeInsets.symmetric(
            vertical: LayoutConstants.dimen_15,
            horizontal: LayoutConstants.dimen_16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutConstants.dimen_8.r),
          ),
        ),
      );
    } else {
      return ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, RouteConstants.rating),
        label: Icon(
          Icons.navigate_next,
          size: LayoutConstants.dimen_24,
          color: AppColor.white,
        ),
        icon: Text(
          HomeScreenConstants.nextButton,
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
      );
    }
  }
}
