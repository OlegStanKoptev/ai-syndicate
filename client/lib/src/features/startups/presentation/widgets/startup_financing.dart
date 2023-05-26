import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupFinancing extends StatelessWidget {
  const StartupFinancing({super.key});

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    // final financing = startup.financing;
    // if (financing == null) {
    //   return Container();
    // }
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
        Card(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text('Invest', style: textTheme.bodyLarge),
            ),
          ),
        )
      ],
    );
  }
}
