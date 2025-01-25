import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';

class IconContainerWidget extends StatelessWidget {
  const IconContainerWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 129.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.w),
          color: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Shadow color
              blurRadius: 3, // Blur radius
              offset: Offset(0, 3), // Shadow offset
            ),
          ]),
      child: child,
    );
  }
}
