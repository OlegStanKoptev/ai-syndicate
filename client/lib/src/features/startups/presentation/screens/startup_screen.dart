import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/presentation/widgets/startup_description.dart';
import 'package:client/src/features/startups/presentation/widgets/startup_verification.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupScreen extends StatelessWidget {
  final String startupId;
  const StartupScreen({super.key, required this.startupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: FutureDataConsumer(
            load: () => Provider.of<StartupService>(context, listen: false)
                .getStartup(id: startupId),
            data: (startup) => ListView(children: [
              StartupDescription(startup: startup),
              StartupVerification(startup: startup)
            ]),
          ),
        ),
      ),
    );
  }
}
