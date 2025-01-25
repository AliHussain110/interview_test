import 'package:flutter/material.dart';
import '../features/signuppage/widget/iconcontainer.dart';
import '../theme/colors.dart';
import '../theme/text_theme_style.dart';
import '../utils/customsizeboxes.dart';

class LoginOptionWidget extends StatelessWidget {
  const LoginOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'or continue with',
          style: AppTextStyles.urbanistExraLargeBold(
            color: AppColors.textColor,
          ),
        ),
        AppSpaces.largeHeight(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            IconContainerWidget(child: Image.asset('assets/images/fb.png')),
            IconContainerWidget(child: Image.asset('assets/images/google.png'))
          ],
        ),
      ],
    );
  }
}
