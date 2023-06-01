import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/startups/domain/models/developer_application_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/enum_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplciationsList extends StatelessWidget {
  final Iterable<DeveloperApplicationModel>? applications;
  const ApplciationsList({super.key, required this.applications});

  @override
  Widget build(BuildContext context) {
    final applications = this.applications;
    if (applications == null || applications.isEmpty) {
      return const Center(
        child: Text('Wow, such empty...'),
      );
    }
    final currentUser = Provider.of<ProfileService>(context).currentUser;
    final textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: applications.length,
      itemBuilder: (context, index) {
        final application = applications.elementAt(index);
        final startup = application.startup;
        return Card(
          child: ListTile(
            title: Text(
              application.startup?.name ?? application.startupId,
              style: textTheme.bodyLarge,
            ),
            subtitle: startup != null
                ? Text(
                    startup.status == StartupStatus.developerApplication
                        ? 'Startup is still hiring...'
                        : startup.status ==
                                StartupStatus.developerApplication_succeded
                            ? 'Startup stopped hiring proccess'
                            : startup.status >=
                                    StartupStatus.developerVoting_succeded
                                ? startup.developerId == currentUser?.id
                                    ? 'You are working on this project!'
                                    : 'Startup has finished voting, but you are not invited'
                                : 'Startup decided not to get in touch with you',
                    style: textTheme.bodySmall,
                    maxLines: 2,
                  )
                : null,
            onTap: () =>
                StartupRoute(startupId: application.startupId).go(context),
          ),
        );
      },
    );
  }
}
