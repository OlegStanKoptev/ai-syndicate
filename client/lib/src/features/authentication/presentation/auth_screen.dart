import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello fellow human!',
                          style: textTheme.headlineMedium),
                      const SizedBox(height: 12),
                      Text(
                          'Do you want to join our gang or maybe you are already a member?',
                          style: textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () => const RegistrationRoute().go(context),
                    child: const Text('Join!'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => const LoginRoute().go(context),
                    child: const Text('Log In'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => const DevLoginRoute().go(context),
                    child: const Text('Dev Log In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
