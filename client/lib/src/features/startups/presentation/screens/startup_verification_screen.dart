import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/vote_model.dart';
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
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (decision == null ||
        (decision == VerificationDecision.nay && nayReason.isEmpty)) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Not all fields have valid values'),
      ));
      return;
    }

    final startupService = Provider.of<StartupService>(context, listen: false);
    final profileService = Provider.of<ProfileService>(context, listen: false);
    final vote = StartupVote(
      yea: decision == VerificationDecision.yea,
      nayReason: nayReason.isEmpty ? null : nayReason,
    );
    try {
      final response =
          await startupService.verificationVote(id: startupId, vote: vote);
      final success = response.statusCode == 200;
      await profileService.updateCurrentUser();

      if (context.mounted) {
        if (success) {
          scaffoldMessenger.showSnackBar(const SnackBar(
            content: Text('You have successfully voted!'),
          ));
          context.pop();
        } else {
          scaffoldMessenger.showSnackBar(const SnackBar(
            content: Text('Issue occurred when voting'),
          ));
        }
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('An issue occurred...'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final decision = useState<VerificationDecision?>(null);
    final nayReason = useTextEditingController();
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
                onPressed: () => vote(context, decision.value, nayReason.text),
                child: const Text('Place vote'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
