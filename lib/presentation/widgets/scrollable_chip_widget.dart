import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_review_app/common/constants/layout_constants.dart';
import 'package:interview_review_app/domain/entities/chip_entity.dart';
import 'package:interview_review_app/presentation/theme/app_color.dart';
import 'package:interview_review_app/presentation/theme/theme_text.dart';

class ScrollableChipWidget extends StatelessWidget {
  final List<ChipEntity> chipList;
  final void Function(ChipEntity) onTap;

  const ScrollableChipWidget({
    Key key,
    @required this.chipList,
    @required this.onTap,
  })  : assert(chipList != null, 'List of Chip should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: LayoutConstants.dimen_96.h),
        child: Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          spacing: 12.w,
          runSpacing: 12.h,
          children: chipList
              .map(
                (value) => MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  removeLeft: true,
                  removeRight: true,
                  child: ActionChip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Text(value.chipTitle),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 9.h,
                    ),
                    labelPadding: EdgeInsets.zero,
                    labelStyle: value.selected
                        ? Theme.of(context).textTheme.chipSelected
                        : Theme.of(context).textTheme.bodyText2,
                    backgroundColor:
                        value.selected ? AppColor.jewel10 : AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(
                        color: value.selected
                            ? AppColor.jewel
                            : AppColor.primaryColorHint38,
                        width: value.selected ? 2.w : 1.w,
                      ),
                    ),
                    onPressed: () => onTap?.call(value),
                  ),
                ),
              )
              .toList(),
        ),
      );
}
