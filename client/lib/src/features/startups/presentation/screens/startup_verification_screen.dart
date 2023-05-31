import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/verification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum VerificationDecision { yea, nay }

class StartupVerificationScreen extends HookWidget {
  final String startupId;
  const StartupVerificationScreen({super.key, required this.startupId});

  void vote(
    BuildContext context,
    VerificationDecision? decision,
    String nayReason,
  ) async {
    final startupService = Provider.of<StartupService>(context);
    final vote = decision == VerificationDecision.yea
        ? const Yea()
        : Nay(reason: nayReason);
    await startupService.verifyStartup(id: startupId, vote: vote);
    if (context.mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final decision = useState<VerificationDecision?>(null);
    final nayReason = useTextEditingController();
    final allowVoting = decision.value == VerificationDecision.yea ||
        (decision.value == VerificationDecision.nay &&
            nayReason.text.isNotEmpty);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup verification'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              RadioMenuButton<VerificationDecision>(
                value: VerificationDecision.yea,
                groupValue: decision.value,
                onChanged: (value) => decision.value = value,
                child: const Text('This project looks good (yes)'),
              ),
              RadioMenuButton<VerificationDecision>(
                value: VerificationDecision.nay,
                groupValue: decision.value,
                onChanged: (value) => decision.value = value,
                child: const Text('There are things to be changed (no)'),
              ),
              if (decision.value == VerificationDecision.nay)
                CustomFormField(
                  controller: nayReason,
                  hintText: 'Reason',
                  validator: (val) => val != null ? null : 'Enter valid reason',
                ),
              ElevatedButton(
                onPressed: allowVoting
                    ? () => vote(context, decision.value, nayReason.text)
                    : null,
                child: const Text('Place vote'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
