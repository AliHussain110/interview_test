import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../api/local_storeage_shared_preference.dart';
import '../../models/user.dart';
import '../../provider/user_provider.dart';
import '../../utils/customsizeboxes.dart';
import '../../theme/colors.dart';
import '../../theme/text_theme_style.dart';
import 'widget/expandabletext.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.w),
        child: Column(
          spacing: 5,
          children: [
            AppSpaces.largeHeight(height: 25),
            _buildAppBar(context, ref),
            AppSpaces.largeHeight(height: 25),
            _buildProfileHeader(user!),
            AppSpaces.largeHeight(),
            _buildEarningsAndRatings(user),
            AppSpaces.largeHeight(),
            _buildAboutMeSection(user),
            AppSpaces.largeHeight(),
            _buildProfileOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Profile',
          style: AppTextStyles.urbanistExraLargeBold(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'logout') {
              _logout(context, ref);
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ];
          },
          child: const Icon(Icons.menu),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(User user) {
    return Container(
      width: 1.0.sw,
      height: 192.h,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/design.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundImage: NetworkImage(user.avatar),
              ),
              Positioned(
                right: 0,
                bottom: 6.w,
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Opacity(
                      opacity: 0.7,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AppSpaces.mediumHeight(),
          Text(
            '${user.firstName} ${user.lastName}',
            style: AppTextStyles.urbanistBold(fontSize: 24),
          ),
          Text(
            user.email,
            style: AppTextStyles.urbanistMediumBold(),
          ),
        ],
      ),
    );
  }

  Widget _buildEarningsAndRatings(User user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildInfoBox(
          text: 'Earnings',
          child: Text(
            '\$${user.earnings}',
            style: AppTextStyles.urbanistBold(
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(width: 15.w),
        _buildInfoBox(
          text: 'Ratings',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (Rect rect) {
                  return const LinearGradient(
                    stops: [0.5, 0.5],
                    colors: [Colors.yellow, Colors.grey],
                  ).createShader(rect);
                },
                child: const Icon(
                  Icons.star,
                  size: 24,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                user.ratings,
                style: AppTextStyles.urbanistBold(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBox({required String text, required Widget child}) {
    return Container(
      height: 85.h,
      width: 175.w,
      padding: EdgeInsets.all(10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.w),
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            text,
            style: AppTextStyles.urbanistMediumBold(
              color: AppColors.textColor2,
            ),
          ),
          AppSpaces.smallHeight(),
          child,
        ],
      ),
    );
  }

  Widget _buildAboutMeSection(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me',
          style: AppTextStyles.urbanistBold(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        AppSpaces.smallHeight(),
        ExpandableText(
          text: user.bio,
          maxLength: 100,
        ),
      ],
    );
  }

  Widget _buildProfileOptions() {
    return Column(
      spacing: 15.w,
      children: [
        _buildHorizontalLine(),
        _buildProfileOption(
          text: 'Business Location',
          icon: Icons.location_on_outlined,
        ),
        _buildHorizontalLine(),
        _buildProfileOption(
          text: 'Bookings',
          icon: Icons.wallet_outlined,
        ),
        _buildHorizontalLine(),
        _buildProfileOption(
          text: 'My Services',
          icon: Icons.work_outline_rounded,
        ),
      ],
    );
  }

  Widget _buildProfileOption({required String text, required IconData icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25.w,
          ),
          SizedBox(width: 10.w),
          Text(
            text,
            style: AppTextStyles.urbanistExraLargeBold(),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 20.w,
            color: AppColors.arrowColor,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalLine() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: 1.0,
        width: 1.0.sw,
        color: AppColors.inputFeildColor,
      ),
    );
  }

  void _logout(BuildContext context, WidgetRef ref) async {
    final sharedPreferencesService = SharedPreferencesService();
    await sharedPreferencesService.setRememberMe(false);

    // Navigate to the login screen
    context.go('/login');

    // Clear the user data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userProvider.notifier).clearUser();
    });
  }
}
