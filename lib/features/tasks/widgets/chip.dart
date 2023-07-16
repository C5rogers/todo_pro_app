import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/ui.dart';

class ChipWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget? avatar;
  final bool active;
  final Color? bg;
  const ChipWidget(
      {Key? key,
      this.avatar,
      this.bg,
      this.active = false,
      required this.onTap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: avatar,
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: bg ?? UiConstants.primaryColor)),
      backgroundColor: active ? bg ?? UiConstants.primaryColor : Colors.white,
      label: Text(
        title,
        style: TextStyle(
            fontWeight: active ? FontWeight.bold : FontWeight.w400,
            color: active ? Colors.white : bg ?? UiConstants.primaryColor),
      ),
      onPressed: onTap,
    );
  }
}
