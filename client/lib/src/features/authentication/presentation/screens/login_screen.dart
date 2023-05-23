import 'package:client/src/features/authentication/application/auth_provider.dart';
import 'package:client/src/features/authentication/presentation/utils/string_extension.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const LoginScreenContent(),
    );
  }
}

class LoginScreenContent extends HookConsumerWidget {
  const LoginScreenContent({super.key});

  void login(LoginFormContext formContext, WidgetRef ref) {
    if (formContext.key.currentState!.validate()) {
      ref.read(authRepositoryProvider).login(
            ref: ref,
            email: formContext.email.text,
            password: formContext.password.text,
          );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formContext = LoginFormContext(
      key: useMemoized(GlobalKey<FormState>.new, const []),
      email: useTextEditingController(),
      password: useTextEditingController(),
    );
    return SingleChildScrollView(
      child: Form(
        key: formContext.key,
        child: Column(
          children: [
            CustomFormField(
              controller: formContext.email,
              hintText: 'Email',
              validator: (val) =>
                  val != null && val.isValidEmail ? null : 'Enter valid email',
            ),
            CustomFormField(
              controller: formContext.password,
              hintText: 'Password',
              validator: (val) => val != null && val.isValidPassword
                  ? null
                  : 'Enter valid password',
            ),
            ElevatedButton(
              onPressed: () => login(formContext, ref),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

class LoginFormContext {
  final GlobalKey<FormState> key;
  final TextEditingController email;
  final TextEditingController password;
  LoginFormContext({
    required this.key,
    required this.email,
    required this.password,
  });
}
