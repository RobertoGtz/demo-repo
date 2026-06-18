lib/src/presentation/widgets/username_widget.dart
```dart
import 'package:flutter/material.dart';

class UsernameWidget extends StatelessWidget {
  final String username;

  const UsernameWidget({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      username,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
```

lib/test/src/presentation/widgets/username_widget_test.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/widgets/username_widget.dart';

void main() {
  testWidgets('UsernameWidget displays the correct username', (WidgetTester tester) async {
    const testUsername = 'TestUser';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: UsernameWidget(username: testUsername),
        ),
      ),
    );

    expect(find.text(testUsername), findsOneWidget);
  });
}