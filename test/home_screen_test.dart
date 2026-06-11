import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo_repo/src/presentation/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen shows welcome text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    expect(find.text('Welcome to the demo app'), findsOneWidget);
  });
}
