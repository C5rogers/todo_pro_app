import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/ui.dart';

class ChipWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final bool active;
  const ChipWidget(
      {Key? key, this.active = false, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: UiConstants.primaryColor)),
      backgroundColor: active ? UiConstants.primaryColor : Colors.white,
      label: Text(
        title,
        style: TextStyle(
            fontWeight: active ? FontWeight.bold : FontWeight.w400,
            color: active ? Colors.white : UiConstants.accentColor),
      ),
      onPressed: onTap,
    );
  }
}
