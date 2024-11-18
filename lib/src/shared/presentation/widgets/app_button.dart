import 'package:destinaku/src/core/helper/ui_theme_extention.dart';
import 'package:destinaku/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final VoidCallback? onSubmit;
  final String text;
  final bool isEnable;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.onSubmit,
    required this.text,
    this.isEnable = true,
    this.isLoading = false,
  });

  @override
  State<AppButton> createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
  late bool isEnable;
  @override
  void initState() {
    isEnable = widget.isEnable;
    super.initState();
  }

  void setStateButton(bool value) {
    setState(() {
      isEnable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilddddd');
    return ElevatedButton(
      onPressed: (!widget.isLoading && isEnable) ? widget.onSubmit : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.scaffoldBackgroundColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
      child: widget.isLoading
          ? const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(
              widget.text,
              style: context.regular.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }
}
