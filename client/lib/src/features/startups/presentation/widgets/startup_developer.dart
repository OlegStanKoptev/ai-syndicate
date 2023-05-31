import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDeveloper extends StatelessWidget {
  const StartupDeveloper({super.key});

  void confirm(BuildContext context, FullStartupModel startup) async {
    final startupService = Provider.of<StartupService>(context, listen: false);
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await startupService.confirmFinancingStartup(id: startup.id);
    invalidator.invalidate();
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final developerVoting =
        startup.status >= StartupStatus.developerVoting ? {} : null;
    if (developerVoting == null) {
      return Container();
    }

    final processOngoing = startup.status == StartupStatus.developerVoting;
    final processSuccess =
        startup.status >= StartupStatus.developerVoting_succeded;
    final currentUser = Provider.of<ProfileService>(context).currentUser;
    final ableToAct = currentUser is Expert ||
        (currentUser != null && startup.startuper.id == currentUser.id);

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
              Text('Current leader: "developer0-ais@mail.ru"',
                  style: textTheme.bodyMedium)
            ],
          ),
        ),
        const ListTile(title: Text('developer2-ais@mail.ru / 42%')),
        const ListTile(title: Text('developer1-ais@mail.ru / 78%')),
        const ListTile(title: Text('developer0-ais@mail.ru / 85%')),
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
        processOngoing && ableToAct
            ? Card(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Choose who you prefer',
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
