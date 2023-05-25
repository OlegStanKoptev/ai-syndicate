import 'package:client/src/features/authentication/application/auth_service.dart';
import 'package:client/src/features/authentication/presentation/utils/string_extension.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/routing/routes.dart';
import 'package:client/src/utils/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  void login(BuildContext context, LoginFormContext formContext) async {
    if (formContext.key.currentState!.validate()) {
      try {
        formContext.loading.value = true;
        await Provider.of<AuthService>(context, listen: false).login(
          email: formContext.email.text,
          password: formContext.password.text,
        );
        if (context.mounted) {
          const ProfileRoute().go(context);
        }
      } catch (e) {
        formContext.error.value = e.toString();
      } finally {
        formContext.loading.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formContext = LoginFormContext(
      key: useMemoized(GlobalKey<FormState>.new, const []),
      email: useTextEditingController(),
      password: useTextEditingController(),
      loading: useState(false),
      error: useState(null),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: formContext.key,
              child: Column(
                children: [
                  CustomFormField(
                    controller: formContext.email,
                    hintText: 'Email',
                    validator: (val) => val != null && val.isValidEmail
                        ? null
                        : 'Enter valid email',
                  ),
                  CustomFormField(
                    controller: formContext.password,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (val) => val != null && val.isValidPassword
                        ? null
                        : 'Enter valid password',
                  ),
                  if (formContext.error.value != null)
                    ErrorText(text: formContext.error.value),
                  ElevatedButton(
                    onPressed: formContext.loading.value
                        ? null
                        : () => login(context, formContext),
                    child: formContext.loading.value
                        ? const SizedBox.square(
                            dimension: 24.0,
                            child: CircularProgressIndicator(),
                          )
                        : const Text('Log in'),
                  )
                ],
              ),
            ),
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
