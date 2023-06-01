import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DepositPage extends HookWidget {
  const DepositPage({super.key});

  void deposit(BuildContext context, String amount) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final intAmount = int.tryParse(amount);
    if (intAmount == null) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Please enter a valid number'),
      ));
      return;
    }
    final profileService = Provider.of<ProfileService>(context, listen: false);
    try {
      await profileService.placeDeposit(amount: intAmount);
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text('You successfully deposited $intAmount!'),
      ));
      if (context.mounted) {
        context.pop();
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text('Error occurred'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final amount = useTextEditingController();
    return ListView(
      children: [
        CustomFormField(
          controller: amount,
          hintText: "Amount",
          validator: (value) => value != null ? null : 'Required',
        ),
        ElevatedButton(
            onPressed: () => deposit(context, amount.text),
            child: const Text('Make a deposit'))
      ],
    );
  }
}
