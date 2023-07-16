import 'package:flutter/material.dart';
import 'package:todo_app_pro/config/constants/assets.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/features/shared/other/widgets/loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration:
          BoxDecoration(gradient: UiConstants.rightCornerToLeftCorner()),
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(ImageAssets.logo),
          ),
          const Spacer(),
          const SafeArea(
            child: Loader(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
