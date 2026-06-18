lib/src/domain/user_profile_provider.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileProvider = StateNotifierProvider<UserProfileNotifier, UserProfile>((ref) {
  return UserProfileNotifier();
});

class UserProfile {
  final String name;
  final String email;
  final String avatarUrl;

  UserProfile({
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}

class UserProfileNotifier extends StateNotifier<UserProfile> {
  UserProfileNotifier()
      : super(UserProfile(name: 'Guest', email: 'guest@example.com', avatarUrl: ''));

  void updateProfile(String name, String email, String avatarUrl) {
    state = UserProfile(name: name, email: email, avatarUrl: avatarUrl);
  }
}