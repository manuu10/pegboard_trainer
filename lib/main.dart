import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegboard_trainer/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.dark(useMaterial3: true);

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Flutter Demo',
      theme: baseTheme.copyWith(
        primaryColor: Color.fromARGB(255, 139, 40, 40),
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.notoSansTextTheme(baseTheme.textTheme),
      ),
    );
  }
}
