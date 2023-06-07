import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/financing_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StartupFinancing extends StatelessWidget {
  const StartupFinancing({super.key});

  void confirm(BuildContext context, FullStartupModel startup) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final startupService = Provider.of<StartupService>(context, listen: false);
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    final deadline = await showDatePicker(
      context: context,
      helpText: 'Applications deadline',
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (deadline == null) {
      return;
    }
    try {
      await startupService.financingSuccessConfirm(
        id: startup.id,
        confirmModel: FinancingConfirmModel(
          developerApplicationDeadline: deadline,
        ),
      );
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Successfully moved the startup to hiring stage!'),
      ));
      invalidator.invalidate();
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Issue occurred'),
      ));
    }
  }

  void action(BuildContext context, FullStartupModel startup) async {
    final invalidator = Provider.of<DataInvalidator>(context, listen: false);
    await StartupInvestRoute(startupId: startup.id).push(context);
    invalidator.invalidate();
  }

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final financing =
        startup.status >= StartupStatus.financing ? startup.financing : null;
    if (financing == null) {
      return Container();
    }

    final currentUser = Provider.of<ProfileService>(context).currentUser;

    final processOngoing = startup.status == StartupStatus.financing;
    final processSuccess = startup.status >= StartupStatus.financing_succeded;

    final processWaitsForConfirmation =
        startup.status == StartupStatus.financing_succeded;
    final isStartuper = startup.startuper.id == currentUser?.id;

    final isInvestor = currentUser is User && !isStartuper;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Financing', style: textTheme.headlineSmall),
        ),
        ListTile(
          title: const Text('Current investments'),
          subtitle: Text(
              '${financing.investmentsTotal} out of ${startup.targetFinancing} (${financing.investments.length} investor${financing.investments.length == 1 ? '' : 's'}) until ${DateFormat.yMd().format(financing.financingDeadline)}'),
        ),
        ListTile(
          title: Text(
            processOngoing
                ? 'Startup is looking for funds!'
                : processSuccess
                    ? 'Startup has collected all funds!'
                    : 'Startup failed to gain needed funds within the deadline',
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
