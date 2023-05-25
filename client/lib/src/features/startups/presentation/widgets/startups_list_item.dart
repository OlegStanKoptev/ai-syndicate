import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupsListItem extends StatelessWidget {
  final ShortStartupModel startup;
  const StartupsListItem({super.key, required this.startup});

  @override
  Widget build(BuildContext context) {
    final logoFile = startup.logoFile;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        leading: logoFile != null
            ? Consumer<FileService>(
                builder: (context, fileService, child) => Image.network(
                  fileService.getFileUrl(fileName: logoFile).toString(),
                ),
              )
            : null,
        title: Text(
          startup.name,
          style: textTheme.bodyLarge,
        ),
        subtitle: Text(
          '${startup.status.description}\n${startup.description}',
          style: textTheme.bodySmall,
          maxLines: 2,
        ),
        onTap: () => StartupRoute(startupId: startup.id).go(context),
      ),
    );
  }
}
