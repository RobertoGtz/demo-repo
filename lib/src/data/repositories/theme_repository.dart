import 'package:flutter/material.dart';

class ThemeRepository {
  static const String _themeKey = 'theme_mode';

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    // Simulate saving theme mode
  }

  Future<ThemeMode> loadThemeMode() async {
    // Simulate loading theme mode
    return ThemeMode.system;
  }
}
