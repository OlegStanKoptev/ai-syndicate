import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartupDeveloperApplicationScreen extends HookWidget {
  final String startupId;
  const StartupDeveloperApplicationScreen({super.key, required this.startupId});

  void apply(BuildContext context, String startupId, String message) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (message.isEmpty) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Enter a non empty message'),
      ));
      return;
    }
    final startupService = Provider.of<StartupService>(context, listen: false);
    try {
      await startupService.developerApplicationNew(
          id: startupId, message: message);
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Startuper will get in touch with you later!'),
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
    final message = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup developer application'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              CustomFormField(
                controller: message,
                hintText: 'Message',
                validator: (val) => val != null ? null : 'Enter valid Message',
              ),
              ElevatedButton(
                onPressed: () => apply(context, startupId, message.text),
                child: const Text('Apply'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
