import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupFinancing extends StatelessWidget {
  const StartupFinancing({super.key});

  void confirm(BuildContext context, FullStartupModel startup) async {
    final startupService = Provider.of<StartupService>(context, listen: false);
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await startupService.confirmFinancingStartup(id: startup.id);
    invalidator.invalidate();
  }

  void action(BuildContext context, FullStartupModel startup) {
    StartupInvestRoute(startupId: startup.id).go(context);
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final financing = startup.status >= StartupStatus.financing ? {} : null;
    if (financing == null) {
      return Container();
    }

    final currentUser = Provider.of<ProfileService>(context).currentUser;

    final processOngoing = startup.status == StartupStatus.financing;
    final processSuccess = startup.status >= StartupStatus.financing_succeded;
    final isInvestor = currentUser is User;

    final processWaitsForConfirmation =
        startup.status == StartupStatus.financing_succeded;
    final isStartuper = startup.startuper.id == currentUser?.id;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Financing', style: textTheme.headlineSmall),
        ),
        const ListTile(
          title: Text('Current investments'),
          subtitle: Text('400 out of 592 (3 investors)'),
        ),
        ListTile(
          title: Text(
            processOngoing
                ? 'Startup is looking for funds!'
                : processSuccess
                    ? 'Startup has collected all funds!'
                    : 'Startup failed to gain needed funds',
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
                  child: Text('Start receiving developer applications!',
                      style: textTheme.bodyLarge),
                ),
              ),
              onTap: () => confirm(context, startup),
            ),
          ),
        if (processOngoing && isInvestor)
          Card(
            child: InkWell(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Invest', style: textTheme.bodyLarge),
                ),
              ),
              onTap: () => action(context, startup),
            ),
          ),
      ],
    );
  }
}
