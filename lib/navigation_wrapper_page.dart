import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pegboard_trainer/app_router.dart';

class NavigationWrapperPage extends StatelessWidget {
  const NavigationWrapperPage({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final location = AppRouter.router.location;
    if (location == AppRouter.train) {
      selectedIndex = 1;
    } else if (location == AppRouter.setting) {
      selectedIndex = 2;
    }
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          switch (value) {
            case 0:
              context.go(AppRouter.root);
              break;
            case 1:
              context.go(AppRouter.train);
              break;
            case 2:
              context.go(AppRouter.setting);
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home_rounded),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.circle),
            icon: Icon(Icons.circle_outlined),
            label: 'Train',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
