import 'package:flutter/material.dart';

class ChipEntity {
  String chipTitle;
  bool selected = false;

  ChipEntity({
    @required this.chipTitle,
    this.selected = false,
  }) : assert(chipTitle != null, 'Title must have a text');
}
