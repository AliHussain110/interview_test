import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/bottomnavbar/bottomnavigationbar.dart';
import '../features/landingPage/landingpage.dart';
import '../features/loginpage/loginscreen.dart';
import '../features/signuppage/signup.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/', // Splash Screen
      builder: (BuildContext context, GoRouterState state) {
        return LandingPageScreen();
      },
    ),
    GoRoute(
      path: '/login', // Login Page
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/signup', // Signup Page
      builder: (BuildContext context, GoRouterState state) {
        return SignupPageScreen();
      },
    ),
    GoRoute(
      path: '/home', // Home Page
      builder: (BuildContext context, GoRouterState state) {
        return NavigationPage();
      },
    ),
  ],
);
