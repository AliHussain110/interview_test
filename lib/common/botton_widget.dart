import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/text_theme_style.dart';
import '../../theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.height = 58,
    this.width = 0,
    required this.onTap,
    this.textColor = Colors.white,
    required this.title,
    this.bgroundColor = AppColors.primaryColor,
    this.borderColor = AppColors.primaryColor,
    this.margin = 5,
    this.fontSize = 16,
    this.circularRadius = 16,
    this.rowCheck = false,
    this.icon = Icons.abc,
    this.iconColor = AppColors.primaryColor,
    super.key,
  });
  final String title;
  final Color bgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final double margin;
  final Color borderColor;
  final Color iconColor;
  final void Function()? onTap;
  final double fontSize;
  final double circularRadius;
  final bool rowCheck;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin).w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgroundColor,
          minimumSize: Size(width.sw, height.h),
          maximumSize: Size(width.sw, height.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          side: BorderSide(
            color: borderColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularRadius),
          ),
        ),
        onPressed: onTap,
        child: rowCheck
            ? Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                    size: 25.w,
                  ),
                  Text(
                    title,
                    style: AppTextStyles.urbanistLargeBold(
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                      color: textColor,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: AppTextStyles.urbanistLargeBold(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
