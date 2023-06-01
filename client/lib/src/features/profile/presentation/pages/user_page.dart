import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final avatarImageFile = user.avatarImageFile;
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
                  if (avatarImageFile != null)
                    Consumer<FileService>(
                      builder: (context, fileService, child) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.network(
                            fileService
                                .getFileUrl(fileName: avatarImageFile)
                                .toString(),
                            fit: BoxFit.fitHeight,
                            height: 140,
                          )),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          user.fullName,
                          style: textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Current balance: ${user.balance}',
                          style: textTheme.bodyMedium,
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
                  title: const Text('Deposit money'),
                  onTap: () => const DepositRoute().go(context),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('My investments'),
                  onTap: () => const MyInvestmentsRoute().go(context),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('My startups'),
                  onTap: () => const MyStartupsRoute().go(context),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Create a new startup'),
                  onTap: () => const NewStartupRoute().go(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
