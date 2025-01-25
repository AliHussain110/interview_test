import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/botton_widget.dart';
import '../../models/user.dart';
import '../../provider/user_provider.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme_style.dart';
import '../../utils/customsizeboxes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(context, user),
            _buildInviteFriendsSection(context),
          ],
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeaderSection(BuildContext context, User user) {
    return Container(
      width: 1.0.sw,
      height: 410.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15.w),
        ),
      ),
      child: Column(
        spacing: 15,
        children: [
          SizedBox(height: 0.05.sh),
          _buildUserGreeting(user),
          _buildEarningsCard(user),
        ],
      ),
    );
  }

  // User Greeting Row
  Widget _buildUserGreeting(User user) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Text(
            'Hello!\n${user.firstName} ${user.lastName}',
            style: AppTextStyles.urbanistBold(
              fontSize: 28,
              color: AppColors.backgroundColor,
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 33.r,
            backgroundImage: NetworkImage(user.avatar),
          ),
        ],
      ),
    );
  }

  // Earnings Card
  Widget _buildEarningsCard(User user) {
    return Container(
      width: 354.w,
      height: 175.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.w),
          bottomRight: Radius.circular(35.w),
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15.w,
            left: 15.w,
            child: Text(
              'My Earnings',
              style: AppTextStyles.urbanistExraLargeBold(),
            ),
          ),
          Positioned(
            top: 35.w,
            left: 15.w,
            child: Text(
              '\$${formatNumberWithCommas(user.earnings)}',
              style: AppTextStyles.urbanistBold(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 10.w,
            right: 10.w,
            child: Image.asset(
              'assets/images/design2box.png',
              height: 150.h,
              width: 190.w,
            ),
          ),
          Positioned(
            bottom: -8.w,
            left: -5.w,
            child: Image.asset(
              'assets/images/design1box.png',
              height: 95.h,
              width: 200.w,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 10,
            child: ButtonWidget(
              onTap: () {},
              title: 'Details',
              height: 30,
              width: 0.15,
              circularRadius: 5,
              bgroundColor: AppColors.buttonColor,
              textColor: AppColors.secondaryTextColor,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // Invite Friends Section
  Widget _buildInviteFriendsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        spacing: 5,
        children: [
          _buildInviteFriendsImage(),
          _buildInviteFriendsText(),
          AppSpaces.smallHeight(),
          _buildInviteFriendsDescription(),
          AppSpaces.smallHeight(),
          _buildCopyReferralLinkButton(),
          _buildSendReferralLinkButton(),
        ],
      ),
    );
  }

  // Invite Friends Image
  Widget _buildInviteFriendsImage() {
    return Container(
      height: 0.1.sh,
      child: Image.asset('assets/images/ppl.png'),
    );
  }

  // Invite Friends Text
  Widget _buildInviteFriendsText() {
    return SizedBox(
      width: 1.0.sw,
      child: Text(
        'Invite your friends and get big discounts',
        style: AppTextStyles.urbanistBold(),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Invite Friends Description
  Widget _buildInviteFriendsDescription() {
    return SizedBox(
      width: 1.0.sw,
      child: Text(
        'Invite your other friends to our platform to get plenty of discounts waiting for you!',
        style: AppTextStyles.urbanistRegular(
          color: Colors.black,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Copy Referral Link Button
  Widget _buildCopyReferralLinkButton() {
    return ButtonWidget(
      width: 0.5,
      height: 50,
      circularRadius: 10,
      onTap: () {},
      title: 'Copy Referral link',
      rowCheck: true,
      icon: Icons.copy_all_outlined,
      iconColor: AppColors.backgroundColor,
    );
  }

  // Send Referral Link Button
  Widget _buildSendReferralLinkButton() {
    return ButtonWidget(
      width: 0.5,
      height: 55,
      circularRadius: 10,
      bgroundColor: AppColors.backgroundColor,
      onTap: () {},
      title: 'Send Referral Link',
      textColor: AppColors.primaryColor,
      rowCheck: true,
      icon: Icons.telegram_sharp,
    );
  }

  // Helper Function to Format Earnings
  String formatNumberWithCommas(int number) {
    final numberString = number.toString();
    final parts = numberString.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

    final buffer = StringBuffer();
    for (int i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(integerPart[i]);
    }

    return '${buffer.toString()}$decimalPart';
  }
}
