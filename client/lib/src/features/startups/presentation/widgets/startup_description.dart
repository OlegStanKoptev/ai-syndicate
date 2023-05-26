import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StartupDescription extends StatelessWidget {
  const StartupDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<FullStartupModel>(context);
    final logoFile = startup.logoFile;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Description', style: textTheme.headlineSmall),
        ),
        if (logoFile != null)
          Consumer<FileService>(
            builder: (context, fileService, child) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Image.network(
                  fileService.getFileUrl(fileName: logoFile).toString()),
            ),
          ),
        ListTile(
          title: const Text('Name'),
          subtitle: Text(startup.name),
        ),
        ListTile(
          title: const Text('Description'),
          subtitle: Text(startup.description),
        ),
        ListTile(
          title: const Text('Current Status'),
          subtitle: Text(startup.status.description),
        ),
        ListTile(
          title: const Text('Target Financing'),
          subtitle: Text('\$${startup.targetFinancing}'),
        ),
        ListTile(
          title: const Text('Startuper'),
          subtitle: Text(startup.startuper.fullName),
        ),
        ListTile(
          title: const Text('Specifications'),
          subtitle: Text(startup.specificationFile),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => launchUrl(
              Provider.of<FileService>(context, listen: false)
                  .getFileUrl(fileName: startup.specificationFile)),
        ),
      ],
    );
  }
}
