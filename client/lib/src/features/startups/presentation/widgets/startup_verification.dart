import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupVerification extends StatelessWidget {
  const StartupVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final verificationVotes = startup.verification;
    if (verificationVotes == null) {
      return Container();
    }
    final verificationEnded = startup.verificationSucceded != null ||
        startup.verificationFailed != null;
    final verificationSuccess = startup.verificationSucceded != null &&
        startup.verificationFailed == null;
    final isExpert = Provider.of<ProfileService>(context).currentUser is Expert;

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
        !verificationEnded
            ? Card(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Leave a vote!', style: textTheme.bodyLarge),
                  ),
                ),
              )
            : ListTile(
                title: Text(
                  verificationSuccess
                      ? 'Startup idea has been approved!'
                      : 'Startup idea is declined',
                  style: TextStyle(
                    color: verificationSuccess ? Colors.green : Colors.red,
                  ),
                ),
              ),
      ],
    );
  }
}
