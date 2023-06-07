import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/developer_voting_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDeveloper extends StatelessWidget {
  const StartupDeveloper({super.key});

  void confirm(BuildContext context, FullStartupModel startup) async {
    final startupService = Provider.of<StartupService>(context, listen: false);
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    final applicationDeveloperId =
        startup.developerVoting?.maxApprovalApplicationsDeveloper.first.id;
    final deadline = await showDatePicker(
      context: context,
      helpText: 'Development deadline',
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (deadline == null || applicationDeveloperId == null) {
      return;
    }
    await startupService.developerVotingSuccessConfirm(
      id: startup.id,
      confirmModel: DeveloperVotingConfirmModel(
        developmentDeadline: deadline,
        applicationDeveloperId: applicationDeveloperId,
      ),
    );
    invalidator.invalidate();
  }

  void action(BuildContext context, FullStartupModel startup) async {
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await StartupDeveloperVotingRoute(startupId: startup.id).push(context);
    invalidator.invalidate();
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final developerVoting = startup.status >= StartupStatus.developerVoting
        ? startup.developerVoting
        : null;
    if (developerVoting == null) {
      return Container();
    }

    final processOngoing = startup.status == StartupStatus.developerVoting;
    final processSuccess =
        startup.status >= StartupStatus.developerVoting_succeded;
    final currentUser = Provider.of<ProfileService>(context).currentUser;
    final ableToAct = (startup.financing?.investments
                .map((e) => e.investor.id)
                .contains(currentUser?.id) ??
            false) ||
        (startup.startuper.id == currentUser?.id);

    final processWaitsForConfirmation =
        startup.status == StartupStatus.developerVoting_succeded;
    final isStartuper = startup.startuper.id == currentUser?.id;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Developer Voting', style: textTheme.headlineSmall),
              Text(
                  '${processSuccess ? 'Chosen developer' : 'Current leader'}: "${developerVoting.maxApprovalApplicationsDeveloper.first.developer.shortOrgName}"',
                  style: textTheme.bodyMedium)
            ],
          ),
        ),
        ...developerVoting.applicationsDeveloper.map(
          (application) => ListTile(
            title: Text(
                '${application.developer.shortOrgName} - ${(application.approval * 100).round()}%'),
          ),
        ),
        ListTile(
          title: Text(
            processOngoing
                ? 'Startup is choosing a developer!'
                : processSuccess
                    ? 'Developer has been invited to work on the project!'
                    : 'Failed to choose a developer...',
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
                  child: Text(
                    'Hire developer with max approval!',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
              onTap: () => confirm(context, startup),
            ),
          ),
        if (processOngoing && ableToAct)
          Card(
            child: InkWell(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Choose who you prefer',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
              onTap: () => action(context, startup),
            ),
          ),
      ],
    );
  }
}
