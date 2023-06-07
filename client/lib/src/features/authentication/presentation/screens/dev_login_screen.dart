import 'package:client/src/features/authentication/application/auth_service.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class DevLoginScreen extends HookWidget {
  const DevLoginScreen({super.key});

  void login(BuildContext context, String email, String password) async {
    await Provider.of<AuthService>(context, listen: false).login(
      email: email,
      password: password,
    );
    if (context.mounted) {
      const ProfileRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: [
              ...Iterable.generate(10).map(
                (e) => Card(
                  child: ListTile(
                    title: Text('user$e-ais@mail.ru'),
                    onTap: () => login(
                      context,
                      'user$e-ais@mail.ru',
                      'user$e',
                    ),
                  ),
                ),
              ),
              ...Iterable.generate(9).map(
                (e) => Card(
                  child: ListTile(
                    title: Text('expert$e-ais@mail.ru'),
                    onTap: () => login(
                      context,
                      'expert$e-ais@mail.ru',
                      'expert$e',
                    ),
                  ),
                ),
              ),
              ...Iterable.generate(10).map(
                (e) => Card(
                  child: ListTile(
                    title: Text('developer$e-ais@mail.ru'),
                    onTap: () => login(
                      context,
                      'developer$e-ais@mail.ru',
                      'developer$e',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginFormContext {
  final GlobalKey<FormState> key;
  final TextEditingController email;
  final TextEditingController password;
  final ValueNotifier<bool> loading;
  final ValueNotifier<String?> error;
  LoginFormContext({
    required this.key,
    required this.email,
    required this.password,
    required this.loading,
    required this.error,
  });
}
