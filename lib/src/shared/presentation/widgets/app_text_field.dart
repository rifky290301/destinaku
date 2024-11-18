import 'package:destinaku/src/core/helper/ui_theme_extention.dart';
import 'package:destinaku/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Widget? preffix;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final int? minLines;
  final int? maxLines;
  // final bool isNotBorder;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final void Function()? onTap;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? padding;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.padding,
    this.suffix,
    this.preffix,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.keyboardType,
    this.minLines,
    this.maxLength,
    this.textCapitalization,
    this.maxLines,
    // this.isNotBorder = false,
    this.autoFocus = false,
    this.inputFormatters,
    this.focusNode,
    this.readOnly = false,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: focusNode,
        textInputAction: textInputAction ?? TextInputAction.next,
        enabled: enabled,
        readOnly: readOnly,
        onTap: onTap,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
          ...?inputFormatters,
          if (textCapitalization == TextCapitalization.characters) UpperCaseTextFormatter(),
        ],
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: preffix,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade700, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.blue.shade700, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColors.danger, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.danger, width: 1),
          ),
          fillColor: const Color(0xffF5F9FC),
          filled: true,
          hintText: hintText,
          hintStyle: context.regular.copyWith(
            color: AppColors.hintText.withOpacity(.3),
            fontSize: 14,
          ),
          errorStyle: context.regular.copyWith(
            color: AppColors.danger,
          ),
        ),
        style: context.regular.copyWith(fontSize: 16),
        controller: controller,
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
