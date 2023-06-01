import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/developer_voting_confirm_model.dart';
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
    await StartupDeveloperReportRoute(startupId: startup.id).push(context);
    invalidator.invalidate();
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final development = startup.status >= StartupStatus.development ? {} : null;
    if (development == null) {
      return Container();
    }

    final processOngoing = startup.status == StartupStatus.development;
    final processSuccess = startup.status >= StartupStatus.development_succeded;
    final currentUser = Provider.of<ProfileService>(context).currentUser;
    final ableToAct = currentUser is Developer;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Development', style: textTheme.headlineSmall),
        ),
        const ListTile(
          title: Text('Latest report / verified'),
          subtitle: Text('reportFile1.pdf'),
        ),
        ListTile(
          title: Text(
            processOngoing
                ? 'Development is undergoing!'
                : processSuccess
                    ? 'Development has been finished!'
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
        processOngoing && ableToAct
            ? Card(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Send in a new report',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
