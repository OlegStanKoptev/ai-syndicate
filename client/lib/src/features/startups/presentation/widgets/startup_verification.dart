import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';

class StartupVerification extends StatelessWidget {
  final FullStartupModel startup;
  const StartupVerification({super.key, required this.startup});

  @override
  Widget build(BuildContext context) {
    final verificationVotes = startup.verification;
    if (verificationVotes == null) {
      return Container();
    }
    final verificationEnded = startup.verificationSucceded != null ||
        startup.verificationFailed != null;
    final verificationSuccess = startup.verificationSucceded != null &&
        startup.verificationFailed == null;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Verification', style: textTheme.headlineSmall),
        ),
        ListTile(
          title: const Text('Positive votes'),
          subtitle: Text(verificationVotes.yeasTotal.toString()),
        ),
        ListTile(
          title: const Text('Negative votes'),
          subtitle: Text(verificationVotes.naysTotal.toString()),
        ),
        if (verificationEnded)
          ListTile(
            title: Text(
                verificationSuccess
                    ? 'Startup idea has been approved!'
                    : 'Startup idea is not verified',
                style: TextStyle(
                  color: verificationSuccess ? Colors.green : Colors.red,
                )),
          ),
      ],
    );
  }
}
