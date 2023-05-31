import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/utils/future_data_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartupInvestScreen extends StatelessWidget {
  final String startupId;
  const StartupInvestScreen({super.key, required this.startupId});

  void invest(BuildContext context, String startupId, String amount) async {
    final startupService = Provider.of<StartupService>(context);
    final invalidate = Provider.of<DataInvalidator>(context);
    final intAmount = int.tryParse(amount);
    if (intAmount != null) {
      await startupService.investInStartup(id: startupId, amount: intAmount);
    }
    if (context.mounted) {
      context.pop();
      invalidate.invalidate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final amount = useTextEditingController();
    final allowInvesting =
        amount.text.isNotEmpty && int.tryParse(amount.text) != null;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup investment'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            children: [
              CustomFormField(
                controller: amount,
                hintText: 'Amount',
                validator: (val) => val != null ? null : 'Enter valid reason',
              ),
              ElevatedButton(
                onPressed: allowInvesting
                    ? () => invest(context, startupId, amount.text)
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
