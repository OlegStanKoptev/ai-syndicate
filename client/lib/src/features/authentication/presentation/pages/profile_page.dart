import 'package:client/src/features/authentication/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return Center(
      child: currentUser.when(
        data: (user) => Column(
          children: [
            Text('Hello ${user.fullName}!'),
            TextButton(
                onPressed: () => ref.read(authRepositoryProvider).logout(ref),
                child: const Text('Log out'))
          ],
        ),
        error: (e, s) => Text('$e', style: const TextStyle(color: Colors.red)),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
