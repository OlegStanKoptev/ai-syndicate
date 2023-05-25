import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';

class StartupDevelopment extends StatelessWidget {
  final FullStartupModel startup;
  const StartupDevelopment({super.key, required this.startup});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Development', style: textTheme.headlineSmall),
        ),
        ListTile(
          title: const Text('Name'),
          subtitle: Text(startup.name),
        ),
      ],
    );
  }
}
