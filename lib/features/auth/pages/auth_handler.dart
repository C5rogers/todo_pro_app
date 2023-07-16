import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_pro/features/auth/data/providers/provider.dart';
import 'package:todo_app_pro/features/auth/pages/local_auth_handler.dart';
import 'package:todo_app_pro/features/auth/pages/onboarding_screen.dart';
import 'package:todo_app_pro/features/auth/pages/splash_screen.dart';
import 'package:todo_app_pro/features/tasks/pages/home.dart';

class AuthHandler extends ConsumerWidget {
  const AuthHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: Builder(
        builder: (context) {
          if (authState.loading) {
            return const SplashScreen();
          } else {
            if (authState.initial ?? false) {
              return const OnboardingScreen();
            } else {
              return authState.authenticated!
                  ? const HomePage()
                  : const LocalAuthHandler();
            }
          }
        },
      ),
    );
  }
}
