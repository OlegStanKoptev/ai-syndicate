import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartupsListItem extends StatelessWidget {
  final ShortStartupModel startup;
  final bool highlight;
  const StartupsListItem({
    super.key,
    required this.startup,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final logoFile = startup.logoFile;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: highlight ? 2.0 : null,
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
        onTap: () async {
          final invalidator =
              Provider.of<DataInvalidator?>(context, listen: false);
          await StartupRoute(startupId: startup.id).push(context);
          invalidator?.invalidate();
        },
      ),
    );
  }
}
