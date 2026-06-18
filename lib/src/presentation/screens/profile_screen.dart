lib/src/presentation/screens/profile_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:demo_repo/src/presentation/widgets/avatar_widget.dart';
import 'package:demo_repo/src/presentation/widgets/username_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            AvatarWidget(),
            SizedBox(height: 16.0),
            UsernameWidget(),
          ],
        ),
      ),
    );
  }
}
```

lib/src/presentation/widgets/avatar_widget.dart
```dart
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.0,
      backgroundColor: Colors.blue,
      child: const Icon(
        Icons.person,
        size: 50.0,
        color: Colors.white,
      ),
    );
  }
}
```

lib/src/presentation/widgets/username_widget.dart
```dart
import 'package:flutter/material.dart';

class UsernameWidget extends StatelessWidget {
  const UsernameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Username',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
```

lib/test/presentation/screens/profile_screen_test.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/screens/profile_screen.dart';

void main() {
  testWidgets('ProfileScreen displays AvatarWidget and UsernameWidget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfileScreen(),
      ),
    );

    expect(find.byType(AvatarWidget), findsOneWidget);
    expect(find.byType(UsernameWidget), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
```

lib/test/presentation/widgets/avatar_widget_test.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/widgets/avatar_widget.dart';

void main() {
  testWidgets('AvatarWidget displays a CircleAvatar with an icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvatarWidget(),
        ),
      ),
    );

    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
```

lib/test/presentation/widgets/username_widget_test.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/widgets/username_widget.dart';

void main() {
  testWidgets('UsernameWidget displays the username text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UsernameWidget(),
        ),
      ),
    );

    expect(find.text('Username'), findsOneWidget);
  });
}