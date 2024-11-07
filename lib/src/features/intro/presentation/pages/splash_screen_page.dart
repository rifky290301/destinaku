import 'dart:async';

import 'package:destinaku/main.dart';
import 'package:destinaku/src/core/router/app_routes.dart';
import 'package:destinaku/src/core/utils/constant/app_constants.dart';
import 'package:destinaku/src/features/intro/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingPage(),
        ),
      ),
    );

    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   AppRouteEnum.login.name,
    //   (route) => false,
    // );
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
