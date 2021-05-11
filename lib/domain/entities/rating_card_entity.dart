import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingCardEntity {
  Color borderColor;
  Color color;
  SvgPicture icon;
  String text1;
  String text2;
  bool isSelected;

  RatingCardEntity(
      {this.borderColor,
      this.color,
      this.icon,
      this.text1,
      this.text2,
      this.isSelected = false});
}
