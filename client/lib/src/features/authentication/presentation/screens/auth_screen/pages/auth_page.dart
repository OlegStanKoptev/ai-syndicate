import 'package:client/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello fellow human!', style: textTheme.headlineMedium),
                  const SizedBox(height: 12),
                  Text(
                      'Do you want to join our gang or maybe you are already a member?',
                      style: textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                  onPressed: () =>
                      ref.read(goRouterProvider).goNamed('register'),
                  child: const Text('Join!')),
              const SizedBox(height: 8),
              TextButton(
                  onPressed: () => ref.read(goRouterProvider).goNamed('login'),
                  child: const Text('Log In')),
            ],
          ),
        ),
      ),
    );
  }
}
