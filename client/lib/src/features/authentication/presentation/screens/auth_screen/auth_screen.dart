import 'package:client/src/features/profile/application/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/auth_page.dart';
import 'pages/profile_page.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorised = ref.watch(currentUserProvider).hasValue;

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: authorised ? const ProfilePage() : const AuthPage(),
    );
  }
}
