import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './colors.dart';

class AppTextStyles {
  static TextStyle urbanistBold({
    Color color = AppColors.mainTextColor,
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.bold,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle urbanistMediumBold({
    Color color = AppColors.mainTextColor,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w600,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle urbanistLargeBold({
    Color color = AppColors.primaryColor,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle urbanistExraLargeBold({
    Color color = AppColors.mainTextColor,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w600,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  static TextStyle urbanistRegular({
    Color color = AppColors.inputFeildColor,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    String fontFamily = 'Urbanist',
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }
}
