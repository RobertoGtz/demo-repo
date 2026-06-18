lib/src/data/repositories/settings_repository.dart

```dart
import 'package:flutter/material.dart';

class SettingsRepository {
  // Simulated in-memory storage for settings
  final Map<String, dynamic> _settingsStorage = {};

  // Fetch a setting by key
  dynamic getSetting(String key) {
    return _settingsStorage[key];
  }

  // Save a setting with a key-value pair
  void saveSetting(String key, dynamic value) {
    _settingsStorage[key] = value;
  }

  // Remove a setting by key
  void removeSetting(String key) {
    _settingsStorage.remove(key);
  }

  // Clear all settings
  void clearSettings() {
    _settingsStorage.clear();
  }
}