import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/vote_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum ReportDecision { yea, nay }

class StartupReportVotingScreen extends HookWidget {
  final String startupId;
  const StartupReportVotingScreen({super.key, required this.startupId});

  void vote(
    BuildContext context,
    ReportDecision? decision,
    String nayReason,
  ) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (decision == null ||
        (decision == ReportDecision.nay && nayReason.isEmpty)) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Not all fields have valid values'),
      ));
      return;
    }

    final startupService = Provider.of<StartupService>(context, listen: false);
    final profileService = Provider.of<ProfileService>(context, listen: false);
    final vote = StartupVote(
      yea: decision == ReportDecision.yea,
      nayReason: nayReason.isEmpty ? null : nayReason,
    );
    try {
      await startupService.developmentReportVote(id: startupId, vote: vote);
      await profileService.updateCurrentUser();

      if (context.mounted) {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text('You have successfully voted!'),
        ));
        context.pop();
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('An issue occurred...'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final decision = useState<ReportDecision?>(null);
    final nayReason = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report validity'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              RadioMenuButton<ReportDecision>(
                value: ReportDecision.yea,
                groupValue: decision.value,
                onChanged: (value) => decision.value = value,
                child: const Text('The report is accurate'),
              ),
              RadioMenuButton<ReportDecision>(
                value: ReportDecision.nay,
                groupValue: decision.value,
                onChanged: (value) => decision.value = value,
                child: const Text('There are issues'),
              ),
              if (decision.value == ReportDecision.nay)
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
