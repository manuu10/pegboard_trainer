import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle dimmed() {
    return const TextStyle(color: Color.fromARGB(255, 116, 116, 116));
  }

  static TextStyle headline([Color? color]) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: color,
    );
  }

  static TextStyle headline2([Color? color]) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: color,
    );
  }

  static TextStyle headline3([Color? color]) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: color,
    );
  }

  static TextStyle headline4([Color? color]) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: color,
    );
  }
}
