import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_pro/config/constants/assets.dart';
import 'package:todo_app_pro/config/constants/ui.dart';
import 'package:todo_app_pro/features/auth/data/providers/provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;

  bool _isAuthEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: _pageParent()),
    );
  }

  Widget _pageParent() {
    return Stack(
      children: [
        PageView.builder(
          physics: const ClampingScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          controller: _pageController,
          itemCount: 4,
          itemBuilder: (context, index) {
            return [
              _pagebuilder(
                index,
                context,
                ImageAssets.onboarding_tasks,
                "Tasks",
                "Add tasks and organize them by project or category ,Set due dates, priorities, and assign them to team members.Get a clear overview of your tasks and stay on top of your work.",
              ),
              _pagebuilder(
                  index,
                  context,
                  ImageAssets.onboarding_reminder,
                  "Reminder",
                  "Never forget a task with timely reminders and notifications.Customize reminders to suit your preferences and schedule ,Snooze or mark tasks as done directly from the reminder."),
              _pagebuilder(
                  index,
                  context,
                  ImageAssets.onboarding_done,
                  "Task Status",
                  "Track the progress of your tasks and mark them as complete.Monitor your team's progress and make adjustments when needed.Get insights into your productivity and improve your performance"),
              _pagebuilder(index, context, ImageAssets.onboarding_finish,
                  "All Set", "Set your settings and continue to the app")
            ][index];
          },
        ),
        _navigator()
      ],
    );
  }

  Widget _pagebuilder(int index, BuildContext context, String asset,
      String title, String description) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 100,
        ),
        SafeArea(
            child: Image.asset(
          asset,
          height: MediaQuery.of(context).size.height * 0.3,
        )),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: UiConstants.accentColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 30,
        ),
        if (currentPage == 3)
          ListTile(
              leading: const Icon(
                Icons.fingerprint,
                size: 30,
              ),
              onTap: () {
                setState(() {
                  _isAuthEnabled = !_isAuthEnabled;
                });
              },
              title: const Text("Enable Biometrics"),
              subtitle: const Text(
                  "Toggle this button to enable biometrics authentication"),
              trailing: AbsorbPointer(
                child: CupertinoSwitch(
                  activeColor: UiConstants.accentColor,
                  value: _isAuthEnabled,
                  onChanged: (v) {},
                ),
              ))
      ],
    );
  }

  Widget _navigator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  4,
                  (current) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: currentPage == current
                                ? UiConstants.accentColor
                                : UiConstants.grayColor,
                            borderRadius: BorderRadius.circular(7.5)),
                        height: 15,
                        width: currentPage == current ? 30 : 15,
                      )),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SafeArea(
            top: false,
            minimum: const EdgeInsets.only(bottom: 50),
            child: CupertinoButton(
                borderRadius: BorderRadius.circular(30),
                color: UiConstants.primaryColor,
                child: Text(currentPage == 3 ? "Continue" : "Next"),
                onPressed: () {
                  if (currentPage == 3) {
                    ref
                        .read(authStateProvider.notifier)
                        .setLocalAuth(_isAuthEnabled);

                    ref
                        .read(authStateProvider.notifier)
                        .setOnboardingFinished();
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  }
                }),
          )
        ],
      ),
    );
  }
}
