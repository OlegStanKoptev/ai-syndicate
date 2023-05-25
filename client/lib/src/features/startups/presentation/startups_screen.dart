import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/presentation/widgets/startups_list.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupsScreen extends StatelessWidget {
  const StartupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Syndicate'),
        actions: [
          IconButton(
            onPressed: () => const ProfileRoute().go(context),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () => const NotificationsRoute().go(context),
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: FutureDataConsumer(
            load: Provider.of<StartupService>(context, listen: false)
                .searchStartups,
            data: (data) => StartupsList(startupsResponse: data),
          ),
        ),
      ),
    );
  }
}
