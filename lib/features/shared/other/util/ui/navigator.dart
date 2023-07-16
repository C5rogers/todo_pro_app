// 🐦 Flutter imports:
import 'package:flutter/material.dart';

Future navigateToScreen(BuildContext context,
    {required Widget screen, bool replace = false}) async {
  if (replace) {
    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  } else {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => screen));
  }
}

Future popRoute(BuildContext context) async => Navigator.pop(context);
