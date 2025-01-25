import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpaces {
  static SizedBox smallHeight({
    double height = 10,
  }) {
    return SizedBox(
      height: height.h,
    );
  }

  static SizedBox mediumHeight({
    double height = 14,
  }) {
    return SizedBox(
      height: height.h,
    );
  }

  static SizedBox normalHeight({
    double height = 16,
  }) {
    return SizedBox(
      height: height.h,
    );
  }

  static SizedBox largeHeight({
    double height = 20,
  }) {
    return SizedBox(
      height: height.h,
    );
  }

  static SizedBox smallwidth({
    double width = 10,
  }) {
    return SizedBox(
      width: width.w,
    );
  }

  static SizedBox mediumWidth({
    double width = 12,
  }) {
    return SizedBox(
      width: width.w,
    );
  }

  static SizedBox normalWidth({
    double width = 14,
  }) {
    return SizedBox(
      width: width.w,
    );
  }

  static SizedBox largeWidth({
    double width = 16,
  }) {
    return SizedBox(
      width: width.w,
    );
  }
}
