import 'package:flutter/material.dart';

class DarkModeToggle extends StatefulWidget {
  final ValueChanged<bool> onToggle;

  const DarkModeToggle({Key? key, required this.onToggle}) : super(key: key);

  @override
  _DarkModeToggleState createState() => _DarkModeToggleState();
}

class _DarkModeToggleState extends State<DarkModeToggle> {
  bool _isDarkMode = false;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    widget.onToggle(_isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: _isDarkMode,
      onChanged: _toggleDarkMode,
      secondary: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
    );
  }
}
