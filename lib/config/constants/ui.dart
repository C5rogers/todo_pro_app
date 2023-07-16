import 'package:flutter/material.dart';

class UiConstants {
  UiConstants._();

  static const Color primaryColor = Color(0xffd32f2f);
  static const Color accentColor = Color(0xffff5722);
  static const Color grayColor = Color(0xffBDBDBD);
  static const Color grayAccent = Color(0xffEFEDED);

// Gradients
  static LinearGradient leftToRight({List<Color>? colors}) => LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: colors ??
          [
            primaryColor,
            accentColor,
          ]);
  static LinearGradient darkHeaderGradient() => LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            UiConstants.accentColor.withOpacity(0.9),
            const Color(0xff7bb62d),
          ]);

  static LinearGradient grayGradient() => const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            grayColor,
            grayColor,
          ]);

  static LinearGradient topToBottom() => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [accentColor, primaryColor]);

  static LinearGradient rightCornerToLeftCorner() => const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      tileMode: TileMode.mirror,
      colors: [accentColor, primaryColor]);
}
