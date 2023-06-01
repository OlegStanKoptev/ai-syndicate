import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/developer_application_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDeveloperApplication extends StatelessWidget {
  const StartupDeveloperApplication({super.key});

  void confirm(BuildContext context, FullStartupModel startup) async {
    final startupService = Provider.of<StartupService>(context, listen: false);
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    final deadline = await showDatePicker(
      context: context,
      helpText: 'Voting deadline',
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (deadline == null) {
      return;
    }
    await startupService.developerApplicationSuccessConfirm(
      id: startup.id,
      confirmModel: DeveloperApplicationConfirmModel(
        developerVotingDeadline: deadline,
      ),
    );
    invalidator.invalidate();
  }

  void action(BuildContext context, FullStartupModel startup) async {
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await StartupDeveloperApplicationRoute(startupId: startup.id).push(context);
    invalidator.invalidate();
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final developerApplication =
        startup.status >= StartupStatus.developerApplication
            ? startup.developerApplication
            : null;
    if (developerApplication == null) {
      return Container();
    }

    final currentUser = Provider.of<ProfileService>(context).currentUser;

    final processOngoing = startup.status == StartupStatus.developerApplication;
    final processSuccess =
        startup.status >= StartupStatus.developerApplication_succeded;
    final isDeveloper = currentUser is Developer;

    final processWaitsForConfirmation =
        startup.status == StartupStatus.developerApplication_succeded;
    final isStartuper = startup.startuper.id == currentUser?.id;
    final hasApplied = developerApplication.applications
        .map((e) => e.developer.id)
        .contains(currentUser?.id);

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Developer Application', style: textTheme.headlineSmall),
        ),
        ListTile(
          title: const Text('Applications received'),
          subtitle: Text(developerApplication.applications.length.toString()),
        ),
        ListTile(
          title: Text(
            processOngoing
                ? 'Startup is looking for developers!${hasApplied ? '\nHowever, you have already applied!' : ''}'
                : processSuccess
                    ? 'Developer applications are no longer received!'
                    : 'Failed to receive needed number of applications',
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
                  child: Text('Start voting for developer applications!',
                      style: textTheme.bodyLarge),
                ),
              ),
              onTap: () => confirm(context, startup),
            ),
          ),
        if (processOngoing && isDeveloper && !hasApplied)
          Card(
            child: InkWell(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Propose myself as a candidate',
                      style: textTheme.bodyLarge),
                ),
              ),
              onTap: () => action(context, startup),
            ),
          ),
      ],
    );
  }
}
