import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/profile/presentation/widgets/applications_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<ProfileService>().currentUser;
    if (currentUser is! Developer) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My applications'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ApplciationsList(
            applications: currentUser.applicationsDeveloper,
          ),
        ),
      ),
    );
  }
}
