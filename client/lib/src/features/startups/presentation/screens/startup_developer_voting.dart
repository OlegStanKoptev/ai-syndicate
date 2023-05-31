import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartupDeveloperVotingScreen extends HookWidget {
  final String startupId;
  const StartupDeveloperVotingScreen({super.key, required this.startupId});

  void vote(BuildContext context, String applicationDeveloperId) async {
    final startupService = Provider.of<StartupService>(context);
    await startupService.voteForDeveloper(
        id: startupId, applicationDeveloperId: applicationDeveloperId);
    if (context.mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chosenApplication = useState<String?>(null);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup verification'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: const [
              // RadioMenuButton<VerificationDecision>(
              //   value: VerificationDecision.yea,
              //   groupValue: decision.value,
              //   onChanged: (value) => decision.value = value,
              //   child: const Text('This project looks good (yes)'),
              // ),
              // ElevatedButton(
              //   onPressed: allowVoting
              //       ? () => vote(context, decision.value, nayReason.text)
              //       : null,
              //   child: const Text('Place vote'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
