import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupDevelopment extends StatelessWidget {
  const StartupDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    // final development = startup.development;
    // if (development == null) {
    //   return Container();
    // }
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
        Card(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text('Send in a new report', style: textTheme.bodyLarge),
            ),
          ),
        )
      ],
    );
  }
}
