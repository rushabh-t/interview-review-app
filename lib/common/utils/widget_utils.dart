import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container getEmptyContainer({
  ValueKey key,
}) =>
    Container(
      key: key,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
    );

SvgPicture getSvgPicture({
  @required String assetName,
  Size size,
  ValueKey key,
}) {
  final isAssetNameEmpty = assetName?.isEmpty ?? true;
  return isAssetNameEmpty
      ? null
      : SvgPicture.asset(
          assetName,
          width: size.width,
          height: size.height,
          key: key,
        );
}
