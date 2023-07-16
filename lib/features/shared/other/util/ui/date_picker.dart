import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/ui.dart';

typedef DatePickerChanged = void Function(DateTime? date);

MaterialColor primarySwatch =
    MaterialColor(0xffd32f2f, swatchColorMaker(UiConstants.primaryColor));

Map<int, Color> swatchColorMaker(Color color) {
  return <int, Color>{
    50: color.withOpacity(0.1),
    100: color.withOpacity(0.2),
    200: color.withOpacity(0.3),
    300: color.withOpacity(0.4),
    400: color.withOpacity(0.5),
    500: color.withOpacity(0.6),
    600: color.withOpacity(0.7),
    700: color.withOpacity(0.8),
    800: color.withOpacity(0.9),
    900: color.withOpacity(1),
  };
}

Future datePicker(
  BuildContext context, {
  required DatePickerChanged onpicked,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime? date = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(1920),
    lastDate: lastDate ?? DateTime.now(),
    builder: (context, child) {
      return Theme(
        data: ThemeData(
          primarySwatch: primarySwatch,
        ),
        child: child!,
      );
    },
  );

  onpicked(date);
}
