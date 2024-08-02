import 'package:flutter/material.dart';
import 'package:lib_components/themes/dark_mode.dart';
import 'package:lib_components/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // initially, light mode
  ThemeData _themeData = lightMode;

  // get theme
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isDarkMode => _themeData == darkMode;

  bool get isLightMode => _themeData == lightMode;

  // set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    // update Ui
    notifyListeners();
  }

  // toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  // toggle theme 2
  void toggleTheme2(value) {
    if (value == 1) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

}
