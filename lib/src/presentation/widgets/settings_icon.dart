import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsIcon({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: onPressed,
    );
  }
}
