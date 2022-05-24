import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle heading = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 28.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle subHeader = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
    letterSpacing: 5,
  );

  static const TextStyle label = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle accent = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle accentL = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static const TextStyle msg = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimaryColor,
      height: 1.5);

  static const TextStyle date = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
    height: 1.5,
    letterSpacing: 1.0,
  );

  static const TextStyle hintText = TextStyle(
      fontFamily: 'Mulish',
      fontSize: 13.0,
      fontWeight: FontWeight.w600,
      color: AppColors.hintTextColor,
      height: 1.85);
}