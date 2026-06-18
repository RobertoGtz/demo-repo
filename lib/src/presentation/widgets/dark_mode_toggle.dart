import 'package:flutter/material.dart';

class DarkModeToggle extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  const DarkModeToggle({
    Key? key,
    required this.isDarkMode,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text('Dark Mode'),
      value: isDarkMode,
      onChanged: onToggle,
      secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
    );
  }
}