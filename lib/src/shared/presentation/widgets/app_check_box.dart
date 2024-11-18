import 'package:flutter/material.dart';

class AppCheckbox extends StatefulWidget {
  final bool initialValue;
  final void Function(bool)? onChanged;
  final Widget? description;
  const AppCheckbox({
    super.key,
    this.initialValue = false,
    required this.onChanged,
    this.description,
  });

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() => value = !value);
        widget.onChanged?.call(value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            checkColor: Colors.white,
            value: value,
            fillColor: WidgetStatePropertyAll(Colors.blue.shade700),
            side: const BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onChanged: (val) {
              setState(() => value = val!);
              widget.onChanged?.call(val!);
            },
          ),
          if (widget.description != null) Expanded(child: widget.description!)
        ],
      ),
    );
  }
}
