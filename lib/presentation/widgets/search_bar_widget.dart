import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/common/constants/svg_constants.dart';
import 'package:interview_review_app/common/utils/widget_utils.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';

class SearchbarWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchbarWidget({
    Key key,
    @required this.hintText,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _SearchbarWidgetState createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  @override
  Widget build(BuildContext context) => Card(
        elevation: LayoutConstants.dimen_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LayoutConstants.dimen_8),
        ),
        child: TextField(
          onChanged: (value) => widget.onChanged.call(value),
          autocorrect: false,
          autofocus: false,
          cursorColor: AppColor.regalBlue,
          decoration: new InputDecoration(
            hintText: widget.hintText,
            contentPadding: EdgeInsets.only(
                left: LayoutConstants.dimen_8.w,
                top: LayoutConstants.dimen_9.h),
            border: InputBorder.none,
            hintStyle: Theme.of(context).textTheme.searchText,
            suffixIcon: Container(
              padding: EdgeInsets.all(LayoutConstants.dimen_8),
              child: getSvgPicture(
                  assetName: SvgConstants.searchIcon,
                  size: Size(
                      LayoutConstants.dimen_16.w, LayoutConstants.dimen_16.h)),
            ),
          ),
        ),
      );
}
