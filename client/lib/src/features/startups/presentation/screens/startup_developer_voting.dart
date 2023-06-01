import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartupDeveloperVotingScreen extends HookWidget {
  final String startupId;
  const StartupDeveloperVotingScreen({super.key, required this.startupId});

  void vote(BuildContext context, String applicationDeveloperId) async {
    final startupService = Provider.of<StartupService>(context, listen: false);
    await startupService.developerVotingVote(
      id: startupId,
      applicationDeveloperId: applicationDeveloperId,
    );
    if (context.mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chosenApplication = useState<String?>(null);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup developer voting'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              FutureDataConsumer(
                load: () => Provider.of<StartupService>(context, listen: false)
                    .getStartup(id: startupId),
                data: (data, _) {
                  final developerVoting = data.developerVoting;
                  if (developerVoting == null) {
                    return Container();
                  }
                  return Column(
                    children: developerVoting.applicationsDeveloper
                        .map(
                          (application) => RadioMenuButton<String>(
                            value: application.id,
                            groupValue: chosenApplication.value,
                            onChanged: (value) =>
                                chosenApplication.value = value,
                            child: Text(application.developer.shortOrgName),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              ElevatedButton(
                onPressed: chosenApplication.value != null
                    ? () => vote(context, chosenApplication.value!)
                    : null,
                child: const Text('Choose'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
