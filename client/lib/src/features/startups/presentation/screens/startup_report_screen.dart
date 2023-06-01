import 'dart:io';

import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/authentication/presentation/utils/file_controller.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_image_form_field.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartupReportScreen extends HookWidget {
  final String startupId;
  const StartupReportScreen({super.key, required this.startupId});

  void invest(BuildContext context, String startupId, File? file) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (file == null) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Please choose a valid file'),
      ));
      return;
    }
    final startupService = Provider.of<StartupService>(context, listen: false);
    try {
      final fileId = await Provider.of<FileService>(context, listen: false)
          .uploadFile(file: file);
      if (fileId == null) {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text('Issue occurred when uploading the file'),
        ));
        return;
      }
      await startupService.developmentReport(
        id: startupId,
        reportFileId: fileId,
      );
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Successfully published the report'),
      ));
      if (context.mounted) {
        context.pop();
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Issue occurred'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final file = useFileController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup development report'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              CustomImageFormField(
                controller: file,
                validator: (v) => v != null ? null : 'Please choose a file',
              ),
              ElevatedButton(
                onPressed: () => invest(context, startupId, file.chosenFile),
                child: const Text('Send in a report'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
