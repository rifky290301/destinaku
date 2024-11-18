import 'dart:async';

import 'package:destinaku/src/core/helper/helper.dart';
import 'package:destinaku/src/core/router/app_routes.dart';
import 'package:destinaku/src/core/utils/constant/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    late String route;
    Timer(const Duration(seconds: 3), () {
      if (Helper.isHaveSeenOnboarding) {
        if (FirebaseAuth.instance.currentUser != null) {
          route = AppRoute.home;
        } else {
          route = AppRoute.login;
        }
      } else {
        route = AppRoute.onBoarding;
      }
      context.pushReplacement(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              '${assets}logo/logo.svg',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
