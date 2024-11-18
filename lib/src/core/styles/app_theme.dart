import 'package:destinaku/src/core/styles/app_colors.dart';
import 'package:destinaku/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

/// Light theme
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.textBold,
    headlineMedium: AppTextStyle.textSemiBold,
    bodyMedium: AppTextStyle.textMedium,
    headlineSmall: AppTextStyle.textRegular,
  ),
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
  textTheme: TextTheme(
    headlineLarge: AppTextStyle.textBold.copyWith(color: Colors.white),
    headlineMedium: AppTextStyle.textSemiBold.copyWith(color: Colors.white),
    bodyMedium: AppTextStyle.textMedium.copyWith(color: Colors.white),
    headlineSmall: AppTextStyle.textRegular.copyWith(color: Colors.white),
  ),
);
