import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/border_radius.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

abstract class AppDecoration {

  static const decor16 = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: AppBorderRadius.borderRadiusAll16,
  );
  static const decor8 = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: AppBorderRadius.borderRadiusAll8,
  );
  static const decorT8B16 = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: AppBorderRadius.borderRadiusTop8Bottom16,
  );

}