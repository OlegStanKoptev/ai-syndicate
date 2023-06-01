import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/profile/presentation/pages/deposit_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<ProfileService>().currentUser;
    if (currentUser is! User) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a deposit'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const DepositPage(),
        ),
      ),
    );
  }
}
