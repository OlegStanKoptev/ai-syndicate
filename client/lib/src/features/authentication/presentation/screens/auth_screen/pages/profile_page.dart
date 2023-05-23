import 'package:client/src/constants/file_provider.dart';
import 'package:client/src/features/authentication/application/auth_provider.dart';
import 'package:client/src/features/profile/application/profile_provider.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    return Center(
      child: currentUser.when(
        data: (userModel) => userModel.map(
          admin: (_) => const Text('Admin not supported',
              style: TextStyle(color: Colors.red)),
          developer: (_) => const Text('Developer not supported',
              style: TextStyle(color: Colors.red)),
          expert: (_) => const Text('Expert not supported',
              style: TextStyle(color: Colors.red)),
          user: (user) => UserPage(user: user),
        ),
        error: (e, s) => Text('$e', style: const TextStyle(color: Colors.red)),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

class UserPage extends ConsumerWidget {
  const UserPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarUrl =
        ref.watch(fileUrlProvider(fileName: user.avatarImageFile));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(avatarUrl),
        Text('Hello ${user.fullName}!'),
        TextButton(
          onPressed: () => ref.read(authRepositoryProvider).logout(ref),
          child: const Text('Log out'),
        )
      ],
    );
  }
}
