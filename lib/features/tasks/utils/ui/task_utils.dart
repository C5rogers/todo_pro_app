import 'package:flutter/material.dart';

Color resolveStatColor(String status) {
  switch (status) {
    case "cancelled":
      return Colors.grey;
    case "ongoing":
      return Colors.amber;
    default:
      return Colors.green;
  }
}

IconData resolveStatIcon(String status) {
  switch (status) {
    case "cancelled":
      return Icons.cancel;
    case "ongoing":
      return Icons.timelapse_sharp;
    default:
      return Icons.checklist_sharp;
  }
}
