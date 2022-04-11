import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

abstract class AppTextStyle {

  static const mainTitle = TextStyle(fontWeight: FontWeight.w700,
      fontSize: 24.0,
      height: 1.16,
      color: AppColors.white90);
  static const appBar = TextStyle(fontWeight: FontWeight.w700,
      fontSize: 17.0,
      height: 1.176,
      color: AppColors.white90);
  static const w400s14h20cW90 = TextStyle(fontWeight: FontWeight.w400,
      fontSize: 14.0,
      height: 1.428,
      color: AppColors.white90);
  static const w400s12h16cW90 = TextStyle(fontWeight: FontWeight.w400,
      fontSize: 12.0,
      height: 1.3,
      color: AppColors.white90);
  static const w500s10h12l02cW90 = TextStyle(fontWeight: FontWeight.w500,
      fontSize: 10.0,
      height: 1.2,
      letterSpacing: 0.2,
      color: AppColors.white90);
}