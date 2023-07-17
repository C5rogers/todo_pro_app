import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_pro/config/constants/ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isAuthEnabled = false;

  @override
  void initState() {
    super.initState();
    readAuthState();
  }

  Future readAuthState() async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    _isAuthEnabled = instance.getBool("auth_enabled") ?? false;
  }

  Future writeAuthState() async {
    SharedPreferences instance = await SharedPreferences.getInstance();

    instance.setBool("auth_enabled", _isAuthEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              iconSize: 30,
              color: UiConstants.accentColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(CupertinoIcons.chevron_left)),
          centerTitle: false,
          automaticallyImplyLeading: false,
          elevation: 0.5,
          title: Text("Settings",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: UiConstants.accentColor)),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: [
            ListTile(
                leading: const Icon(
                  Icons.fingerprint,
                  size: 30,
                ),
                onTap: () async {
                  setState(() {
                    _isAuthEnabled = !_isAuthEnabled;
                  });

                  writeAuthState();
                },
                title: const Text("Enable Authentication"),
                subtitle: const Text(
                    "Toggle this button to enable biometrics authentication"),
                trailing: AbsorbPointer(
                  child: CupertinoSwitch(
                    activeColor: UiConstants.accentColor,
                    value: _isAuthEnabled,
                    onChanged: (v) {},
                  ),
                )),
            ListTile(
                leading: const Icon(
                  Icons.translate,
                  size: 30,
                ),
                onTap: () async {
                  context.setLocale(const Locale('en', 'US'));
                },
                title: const Text("English"),
                trailing: AbsorbPointer(
                  child: Checkbox(
                    activeColor: UiConstants.accentColor,
                    value: context.locale == const Locale('en', 'US'),
                    onChanged: (v) {},
                  ),
                )),
            ListTile(
                leading: const Icon(
                  Icons.translate,
                  size: 30,
                ),
                onTap: () async {
                  context.setLocale(const Locale('am', 'ET'));
                },
                title: const Text("አማርኛ"),
                trailing: AbsorbPointer(
                  child: Checkbox(
                    activeColor: UiConstants.accentColor,
                    value: context.locale == const Locale('am', 'ET'),
                    onChanged: (v) {},
                  ),
                ))
          ],
        ));
  }
}
