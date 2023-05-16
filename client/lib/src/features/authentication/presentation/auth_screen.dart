import 'package:client/src/features/authentication/data/auth_repository.dart';
import 'package:client/src/features/authentication/presentation/pages/auth_page.dart';
import 'package:client/src/features/authentication/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
