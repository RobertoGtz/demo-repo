import 'package:flutter/material.dart';

import 'src/presentation/screens/home_screen.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo App',
      home: HomeScreen(),
    );
  }
}
