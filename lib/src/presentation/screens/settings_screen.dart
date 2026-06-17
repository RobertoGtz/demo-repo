import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/widgets/dark_mode_toggle.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    // Here you would typically notify a theme provider or similar to apply the theme change
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          DarkModeToggle(
            onToggle: _toggleDarkMode,
          ),
        ],
      ),
    );
  }
}
