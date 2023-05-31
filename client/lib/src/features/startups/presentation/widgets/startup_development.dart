import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDevelopment extends StatelessWidget {
  const StartupDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final development = startup.status >= StartupStatus.development ? {} : null;
    if (development == null) {
      return Container();
    }

    final processOngoing = startup.status == StartupStatus.developerVoting;
    final processSuccess =
        startup.status >= StartupStatus.developerVoting_succeded;
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
