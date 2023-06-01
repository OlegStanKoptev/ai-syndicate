import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/profile/presentation/widgets/investments_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyInvestmentsScreen extends StatelessWidget {
  const MyInvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<ProfileService>().currentUser;
    if (currentUser is! User) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My investments'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: InvestmentsList(investments: currentUser.investments),
        ),
      ),
    );
  }
}
