import 'package:destinaku/src/features/auth/presentation/pages/register_page.dart';
import 'package:destinaku/src/features/home/presentation/pages/home_page.dart';
import 'package:destinaku/src/features/intro/presentation/pages/onboarding_page.dart';
import 'package:destinaku/src/shared/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/intro/presentation/pages/splash_screen_page.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final AuthService authService = AuthService();

final GoRouter router = GoRouter(
  // refreshListenable: authService, // Refresh saat status login berubah
  // redirect: (context, state) {
  //   final isLoggedIn = authService.isLoggedIn;
  //   final isLoggingIn = state.matchedLocation == AppRoute.login;

  //   // Jika belum login dan bukan di halaman login, arahkan ke /login
  //   if (!isLoggedIn && !isLoggingIn) return AppRoute.login;

  //   // Jika sudah login dan mencoba ke /login, arahkan ke home
  //   if (isLoggedIn && isLoggingIn) return AppRoute.home;

  //   return null; // Tidak ada redirect
  // },
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreenPage(),
    ),
    GoRoute(
      path: AppRoute.onBoarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoute.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoute.register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: AppRoute.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
