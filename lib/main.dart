import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_pro/config/theme/light/main.dart';
import 'package:todo_app_pro/features/auth/pages/onboarding_screen.dart';
import 'package:todo_app_pro/features/auth/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('am', 'ET')],
          path: 'assets/lang',
          fallbackLocale: const Locale('en', 'US'),
          child: const MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App Pro',
      theme: mainLightTheme(),
      home: const OnboardingScreen(),
    );
  }
}
