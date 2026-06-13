import 'package:shared_preferences/shared_preferences.dart';

class NotificationPreferencesService {
  static const String _keyPushNotificationsEnabled = 'push_notifications_enabled';
  static const String _keyEmailNotificationsEnabled = 'email_notifications_enabled';

  Future<bool> arePushNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyPushNotificationsEnabled) ?? true;
  }

  Future<void> setPushNotificationsEnabled(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyPushNotificationsEnabled, isEnabled);
  }

  Future<bool> areEmailNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyEmailNotificationsEnabled) ?? true;
  }

  Future<void> setEmailNotificationsEnabled(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyEmailNotificationsEnabled, isEnabled);
  }
}