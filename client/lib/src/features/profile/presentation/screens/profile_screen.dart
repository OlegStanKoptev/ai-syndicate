import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/presentation/pages/developer_page.dart';
import 'package:client/src/features/profile/presentation/pages/expert_page.dart';
import 'package:client/src/features/profile/presentation/pages/user_page.dart';
import 'package:client/src/utils/error_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Selector(
        selector: (_, ProfileService profileService) =>
            profileService.currentUser,
        builder: (_, currentUser, child) =>
            currentUser?.map(
              admin: (_) => const ErrorText(text: 'Admin not supported'),
              developer: (developer) => DeveloperPage(developer: developer),
              expert: (expert) => ExpertPage(expert: expert),
              user: (user) => UserPage(user: user),
            ) ??
            Container(),
      ),
    );
  }
}
