import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:speedforce_interview/features/landingPage/widget/customloader.dart';

import '../../api/local_storeage_shared_preference.dart';
import '../../provider/auth_provider.dart';
import '../../provider/user_provider.dart';

class LandingPageScreen extends ConsumerStatefulWidget {
  const LandingPageScreen({super.key});

  @override
  _LandingPageScreenState createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends ConsumerState<LandingPageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          Duration(seconds: 2),
          () async {
            log('getting into login');
            final _sharedPreferencesService = SharedPreferencesService();
            final rememberMe = await _sharedPreferencesService.getRememberMe();

            if (!rememberMe) {
              log('Navigating to login screen');
              if (mounted) {
                context.go('/login');
              }
            } else {
              log('Navigating to Home Page');
              ref.read(fetchProvider({}).future).then((user) {
                if (mounted) {
                  context.go('/home');
                }
                ref.read(userProvider.notifier).setUser(user);

                log('user Log in ${user.firstName}');
              }).catchError(
                (error) {
                  if (mounted) {
                    context.go('/');
                  }
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(25).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.4.sh,
            ),
            Image.asset('assets/images/mainLogo.jpg'),
            Spacer(),
            CustomLoader(),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
