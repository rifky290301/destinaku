import 'package:destinaku/src/core/styles/app_colors.dart';
import 'package:destinaku/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

/// Light theme
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.headline,
    // headlineMedium: AppTextStyle.headlineMediumBlack,
    // bodyMedium: AppTextStyle.bodyMediumBlack,
    // headlineSmall: AppTextStyle.logoSubTitleBlack,
  ),
);

/// Dark theme
final ThemeData darkAppTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
  textTheme: const TextTheme(
    headlineLarge: AppTextStyle.headline,
    // headlineMedium: AppTextStyle.headlineMediumWhite,
    // bodyMedium: AppTextStyle.bodyMediumWhite,
    // headlineSmall: AppTextStyle.logoSubTitleWhite,
  ),
);
