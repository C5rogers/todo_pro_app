import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/features/auth/data/providers/provider.dart';
import 'package:todo_app_pro/features/shared/other/widgets/loader.dart';

class LocalAuthHandler extends ConsumerStatefulWidget {
  const LocalAuthHandler({Key? key}) : super(key: key);

  @override
  _LocalAuthHandlerState createState() => _LocalAuthHandlerState();
}

class _LocalAuthHandlerState extends ConsumerState<LocalAuthHandler> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = true;

  @override
  void initState() {
    super.initState();
    // auth.isDeviceSupported().then(
    //       (bool isSupported) => setState(() => _supportState = isSupported
    //           ? _SupportState.supported
    //           : _SupportState.unsupported),
    //     );

    _authenticate();
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Please provide authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');

    if (authenticated) {
      ref.read(authStateProvider.notifier).setAuthenticated();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: UiConstants.primaryColor, shape: BoxShape.circle),
              height: 150,
              width: 150,
              child: _isAuthenticating
                  ? const Loader(
                      side: 50,
                    )
                  : const Icon(
                      Icons.key,
                      size: 40,
                      color: Colors.white,
                    ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            _authorized,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}

// enum _SupportState {
//   unknown,
//   supported,
//   unsupported,
// }
