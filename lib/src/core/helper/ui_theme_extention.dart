import 'package:flutter/material.dart';

extension UIThemeExtension on BuildContext {
  TextStyle get h1 => Theme.of(this).textTheme.headlineLarge!;
}
