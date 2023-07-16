import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_pro/features/auth/data/providers/provider.dart';

class AuthHandler extends ConsumerWidget {
  const AuthHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: Builder(
        builder: (context) {
          if (authState.loading) {
            // TODO: build splash screen

            return Container();
          } else {
            if (authState.initial!) {
              return Container();
            } else {
              return authState.authenticated! ? Container() : Container();
            }
          }
        },
      ),
    );
  }
}
