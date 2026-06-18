lib/src/presentation/widgets/avatar_widget.dart
```dart
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const AvatarWidget({
    Key? key,
    required this.imageUrl,
    this.radius = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(imageUrl),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
```

lib/test/src/presentation/widgets/avatar_widget_test.dart
```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_repo/src/presentation/widgets/avatar_widget.dart';

void main() {
  testWidgets('AvatarWidget displays image from URL', (WidgetTester tester) async {
    const imageUrl = 'https://example.com/avatar.png';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvatarWidget(imageUrl: imageUrl),
        ),
      ),
    );

    final avatarFinder = find.byType(CircleAvatar);
    expect(avatarFinder, findsOneWidget);

    final circleAvatar = tester.widget<CircleAvatar>(avatarFinder);
    expect(circleAvatar.backgroundImage, isA<NetworkImage>());
    expect((circleAvatar.backgroundImage as NetworkImage).url, imageUrl);
  });

  testWidgets('AvatarWidget uses default radius if not specified', (WidgetTester tester) async {
    const imageUrl = 'https://example.com/avatar.png';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvatarWidget(imageUrl: imageUrl),
        ),
      ),
    );

    final avatarFinder = find.byType(CircleAvatar);
    expect(avatarFinder, findsOneWidget);

    final circleAvatar = tester.widget<CircleAvatar>(avatarFinder);
    expect(circleAvatar.radius, 20.0);
  });

  testWidgets('AvatarWidget uses specified radius', (WidgetTester tester) async {
    const imageUrl = 'https://example.com/avatar.png';
    const customRadius = 30.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvatarWidget(imageUrl: imageUrl, radius: customRadius),
        ),
      ),
    );

    final avatarFinder = find.byType(CircleAvatar);
    expect(avatarFinder, findsOneWidget);

    final circleAvatar = tester.widget<CircleAvatar>(avatarFinder);
    expect(circleAvatar.radius, customRadius);
  });
}