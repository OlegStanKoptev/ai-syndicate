import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartupInvestScreen extends HookWidget {
  final String startupId;
  const StartupInvestScreen({super.key, required this.startupId});

  void invest(BuildContext context, String startupId, String amount) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final intAmount = int.tryParse(amount);
    if (intAmount == null || intAmount == 0) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Enter a valid number'),
      ));
      return;
    }
    final startupService = Provider.of<StartupService>(context, listen: false);
    try {
      await startupService.financingInvest(id: startupId, amount: intAmount);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text('Successfully invested $intAmount'),
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
    final amount = useTextEditingController();
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
                onPressed: () => invest(context, startupId, amount.text),
                child: const Text('Invest'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
