import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pegboard_trainer/pages/settings_page.dart';
import 'package:pegboard_trainer/pages/train_page.dart';

import 'navigation_wrapper_page.dart';

abstract class AppRouter {
  static const root = "/";
  static const train = "/train";
  static const setting = "/settings";

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return NavigationWrapperPage(child: child);
        },
        routes: [
          GoRoute(
            path: root,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: Text("root")),
          ),
          GoRoute(
            path: train,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: TrainPage()),
          ),
          GoRoute(
            path: setting,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: SettingsPage()),
          ),
        ],
      )
    ],
  );
}
