import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDeveloperApplication extends StatelessWidget {
  const StartupDeveloperApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    // final developerApplication = startup.developerApplication;
    // if (developerApplication == null) {
    //   return Container();
    // }
    const applicationOpen = true;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Developer Application', style: textTheme.headlineSmall),
        ),
        const ListTile(
          title: Text('Applications received'),
          subtitle: Text('3'),
        ),
        Card(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                applicationOpen
                    ? 'Propose myself as a candidate'
                    : 'Developer applications are no longer accepted!',
                style: textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
