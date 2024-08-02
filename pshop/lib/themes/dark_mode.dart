import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade800),
);
