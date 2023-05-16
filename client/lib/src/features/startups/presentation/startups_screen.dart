import 'package:client/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartupsScreen extends HookConsumerWidget {
  const StartupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startups'),
        actions: [
          IconButton(
            onPressed: () => ref.read(goRouterProvider).goNamed('auth'),
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: const Center(
        child: Text('startups list is to be here 😀'),
      ),
    );
  }
}
