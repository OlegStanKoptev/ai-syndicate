import 'package:client/src/features/authentication/presentation/screens/register_screen/pages/developer_register_page.dart';
import 'package:client/src/features/authentication/presentation/screens/register_screen/pages/user_register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum RegisterScreenMode { user, developer }

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final mode = useState(RegisterScreenMode.user);
    Widget content;
    switch (mode.value) {
      case RegisterScreenMode.user:
        content = const UserRegisterPage();
      case RegisterScreenMode.developer:
        content = const DeveloperRegisterPage();
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              TextButton(
                onPressed: () => mode.value = RegisterScreenMode.user,
                child: const Text('user'),
              ),
              TextButton(
                onPressed: () => mode.value = RegisterScreenMode.developer,
                child: const Text('developer'),
              ),
              content
            ],
          ),
        ),
      ),
    );
  }
}
