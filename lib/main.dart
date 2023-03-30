import 'package:flutter/material.dart';
import 'package:pegboard_trainer/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
