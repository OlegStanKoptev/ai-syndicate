import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDevelopment extends StatelessWidget {
  const StartupDevelopment({super.key});

  void confirm(BuildContext context, FullStartupModel startup) async {
    final startupService = Provider.of<StartupService>(context, listen: false);
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await startupService.developmentSuccessConfirm(id: startup.id);
    invalidator.invalidate();
  }

  void action(BuildContext context, FullStartupModel startup) async {
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await StartupDeveloperReportRoute(startupId: startup.id).push(context);
    invalidator.invalidate();
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final development = startup.status >= StartupStatus.development
        ? startup.development
        : null;
    if (development == null) {
      return Container();
    }

    final processOngoing = startup.status == StartupStatus.development;
    final processSuccess = startup.status >= StartupStatus.development_succeded;
    final currentUser = Provider.of<ProfileService>(context).currentUser;
    final ableToAct = currentUser is Developer;

    final processWaitsForConfirmation =
        startup.status == StartupStatus.development_succeded;
    final isStartuper = startup.startuper.id == currentUser?.id;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Development', style: textTheme.headlineSmall),
        ),
        ...development.reports
            .map(
              (report) => ListTile(
                title: Text('Report ${report.reportFile}'),
                subtitle: Text(
                  '${report.yeas} liked it, ${report.nays} disliked it',
                ),
              ),
            )
            .toList(),
        ListTile(
          title: Text(
            processOngoing
                ? 'Development is undergoing!'
                : processSuccess
                    ? 'Development has finished!'
                    : 'Development has been halted',
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
                    'Finish the project!',
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
                    'Send in a new report',
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
