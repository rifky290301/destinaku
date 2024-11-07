import 'package:destinaku/src/core/helper/ui_theme_extention.dart';
import 'package:destinaku/src/core/styles/app_gradients.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final VoidCallback? onPressed;
  final String text;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    // this.borderRadius,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        gradient: AppGradients.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(text, style: context.h1),
      ),
    );
  }
}
