import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/verification_confirm_model.dart';
import 'package:client/src/features/startups/domain/responses/startup_verification_response.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupVerification extends StatelessWidget {
  const StartupVerification({super.key});

  void confirm(BuildContext context, FullStartupModel startup) async {
    final startupService = Provider.of<StartupService>(context, listen: false);
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await startupService.verificationSuccessConfirm(
      id: startup.id,
      confirm: VerificationConfirmModel(
        financingDeadline: DateTime.now().add(
          const Duration(days: 7),
        ),
      ),
    );
    invalidator.invalidate();
  }

  void action(BuildContext context, FullStartupModel startup) async {
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await StartupVerificationRoute(startupId: startup.id).push(context);
    invalidator.invalidate();
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final verificationVotes = startup.status >= StartupStatus.verification
        ? startup.verification ??
            StartupVerificationResponse(yeasTotal: 5, naysTotal: 2)
        : null;
    if (verificationVotes == null) {
      return Container();
    }

    final currentUser = Provider.of<ProfileService>(context).currentUser;

    final processOngoing = startup.status == StartupStatus.verification;
    final processSuccess =
        startup.status >= StartupStatus.verification_succeded;
    final canVote = currentUser is Expert &&
        !(currentUser.votesNewStartup ?? [])
            .map((e) => e.startupId)
            .contains(startup.id);

    final processWaitsForConfirmation =
        startup.status == StartupStatus.verification_succeded;
    final isStartuper = startup.startuper.id == currentUser?.id;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Verification', style: textTheme.headlineSmall),
        ),
        ListTile(
          title: const Text('Positive votes'),
          subtitle: Text(verificationVotes.yeasTotal.toString()),
        ),
        ListTile(
          title: const Text('Negative votes'),
          subtitle: Text(verificationVotes.naysTotal.toString()),
        ),
        ListTile(
          title: Text(
            processOngoing
                ? 'Startup is in the process of verification'
                : processSuccess
                    ? 'Startup idea has been approved!'
                    : 'Startup idea is declined',
            style: TextStyle(
              color: processOngoing
                  ? Colors.purple
                  : processSuccess
                      ? Colors.green
                      : Colors.red,
            ),
          ),
        ),
        if (processWaitsForConfirmation && isStartuper)
          Card(
            child: InkWell(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child:
                      Text('Start the financing!', style: textTheme.bodyLarge),
                ),
              ),
              onTap: () => confirm(context, startup),
            ),
          ),
        if (processOngoing && canVote)
          Card(
            child: InkWell(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Leave a vote!', style: textTheme.bodyLarge),
                ),
              ),
              onTap: () => action(context, startup),
            ),
          ),
      ],
    );
  }
}
