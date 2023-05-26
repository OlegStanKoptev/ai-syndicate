import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDeveloper extends StatelessWidget {
  const StartupDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    // final developerVoting = startup.developerVoting;
    // if (developerVoting == null) {
    //   return Container();
    // }
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
        Card(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text('Choose who you prefer', style: textTheme.bodyLarge),
            ),
          ),
        )
      ],
    );
  }
}
