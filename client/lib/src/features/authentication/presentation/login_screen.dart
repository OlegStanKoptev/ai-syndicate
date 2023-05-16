import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('email'),
              Text('password'),
            ],
          ),
        ),
      ),
    );
  }
}
