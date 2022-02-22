import 'package:flutter/material.dart';

enum SelectedTheme { Light, Dark }

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.system}) : _mode = mode;
  bool isDarkMode = false;

  void toggleMode(SelectedTheme selectedTheme) {
    if (selectedTheme == SelectedTheme.Light) {
      _mode = ThemeMode.light;
    } else {
      _mode = ThemeMode.dark;
    }

    notifyListeners();
  }

  toggleIsDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      _mode = ThemeMode.dark;
    } else {
      _mode = ThemeMode.light;
    }

    notifyListeners();
  }
}
