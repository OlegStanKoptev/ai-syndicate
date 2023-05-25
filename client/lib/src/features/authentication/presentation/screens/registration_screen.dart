import 'package:client/src/features/authentication/presentation/screens/registration_pages/developer_page.dart';
import 'package:client/src/features/authentication/presentation/screens/registration_pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum RegistrationRole { user, developer }

class RegistrationScreen extends HookWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = useState(RegistrationRole.user);
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                SegmentedButton<RegistrationRole>(
                  segments: const [
                    ButtonSegment(
                      value: RegistrationRole.user,
                      label: Text('User'),
                    ),
                    ButtonSegment(
                      value: RegistrationRole.developer,
                      label: Text('Developer'),
                    ),
                  ],
                  selected: {mode.value},
                  onSelectionChanged: (newValue) => mode.value = newValue.first,
                ),
                mode.value == RegistrationRole.user
                    ? const UserRegistrationPage()
                    : const DeveloperRegisterPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
