import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartupDeveloperApplicationScreen extends StatelessWidget {
  final String startupId;
  const StartupDeveloperApplicationScreen({super.key, required this.startupId});

  void apply(BuildContext context, String startupId, String message) async {
    final startupService = Provider.of<StartupService>(context);
    final invalidate = Provider.of<DataInvalidator>(context);
    await startupService.applyForDevelopment(id: startupId, message: message);
    if (context.mounted) {
      context.pop();
      invalidate.invalidate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = useTextEditingController();
    final allowApplication = message.text.isNotEmpty;
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
                hintText: 'Amount',
                validator: (val) => val != null ? null : 'Enter valid reason',
              ),
              ElevatedButton(
                onPressed: allowApplication
                    ? () => apply(context, startupId, message.text)
                    : null,
                child: const Text('Invest'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
