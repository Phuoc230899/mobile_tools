import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.grey.shade100,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade500,
      inversePrimary: Colors.white),
);
