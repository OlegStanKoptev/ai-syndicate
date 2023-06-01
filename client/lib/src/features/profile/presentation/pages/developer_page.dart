import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeveloperPage extends StatelessWidget {
  final Developer developer;
  const DeveloperPage({super.key, required this.developer});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          developer.shortOrgName,
                          style: textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () => Provider.of<ProfileService>(context,
                                  listen: false)
                              .logout()
                              .then((_) => const AuthRoute().go(context)),
                          child: const Text('Log out'),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              Card(
                child: ListTile(
                  title: const Text('My applications'),
                  onTap: () => const MyApplicationsRoute().go(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
