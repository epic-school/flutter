import 'package:flutter/material.dart';

abstract class AppBorderRadius {
  static const borderRadiusTopLR8 = BorderRadius.only(
      topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0));
  static const borderRadiusTop8Bottom16 = BorderRadius.only(
    topLeft: Radius.circular(8.0),
    topRight: Radius.circular(8.0),
    bottomLeft: Radius.circular(16.0),
    bottomRight: Radius.circular(16.0),
  );
  static const borderRadiusAll16 = BorderRadius.all(Radius.circular(16.0));
  static const borderRadiusAll8 = BorderRadius.all(Radius.circular(8.0));
}
