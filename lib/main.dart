//heres the start of my project
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './routes/routes.dart';

void main() => runApp(
      ProviderScope(
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (context, child) => const MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'SpeedForce Digital',
      debugShowCheckedModeBanner: false,
    );
  }
}
