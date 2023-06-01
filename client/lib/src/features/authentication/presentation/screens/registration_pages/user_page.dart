import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/authentication/application/auth_service.dart';
import 'package:client/src/features/authentication/domain/new_user_model.dart';
import 'package:client/src/features/authentication/presentation/utils/file_controller.dart';
import 'package:client/src/features/authentication/presentation/utils/string_extension.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_image_form_field.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class UserRegistrationPage extends HookWidget {
  const UserRegistrationPage({super.key});

  void submit(
    BuildContext context,
    UserRegistrationFormContext formContext,
  ) async {
    if (formContext.key.currentState!.validate()) {
      try {
        formContext.loading.value = true;
        final authService = Provider.of<AuthService>(context, listen: false);
        await authService.joinAsUser(
          user: NewUserModel(
            email: formContext.email.text,
            password: formContext.password.text,
            avatarImageFile:
                await Provider.of<FileService>(context, listen: false)
                    .uploadFile(file: formContext.avatarFile.chosenFile),
            fullName: formContext.name.text,
          ),
        );
        await authService.login(
          email: formContext.email.text,
          password: formContext.password.text,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('You have successfully registered!'),
          ));
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
    final formContext = UserRegistrationFormContext(
      key: useMemoized(GlobalKey<FormState>.new, const []),
      avatarFile: useFileController(),
      name: useTextEditingController(),
      email: useTextEditingController(),
      password: useTextEditingController(),
      loading: useState(false),
      error: useState(null),
    );
    return Form(
      key: formContext.key,
      child: Column(
        children: [
          CustomFormField(
            controller: formContext.name,
            hintText: 'Full Name',
            validator: (val) =>
                val != null && val.isValidName ? null : 'Enter valid full name',
          ),
          CustomFormField(
            controller: formContext.email,
            hintText: 'Email',
            validator: (val) =>
                val != null && val.isValidEmail ? null : 'Enter valid email',
          ),
          CustomFormField(
            controller: formContext.password,
            hintText: 'Password',
            obscureText: true,
            validator: (val) => val != null && val.isValidPassword
                ? null
                : 'Enter valid password',
          ),
          CustomImageFormField(
            controller: formContext.avatarFile,
            validator: (_) => null,
          ),
          if (formContext.error.value != null)
            Text(
              formContext.error.value!,
              style: const TextStyle(color: Colors.red),
            ),
          ElevatedButton(
            onPressed: formContext.loading.value
                ? null
                : () => submit(context, formContext),
            child: formContext.loading.value
                ? const SizedBox.square(
                    dimension: 24.0,
                    child: CircularProgressIndicator(),
                  )
                : const Text('Register'),
          )
        ],
      ),
    );
  }
}

class UserRegistrationFormContext {
  final GlobalKey<FormState> key;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final FileController avatarFile;
  final ValueNotifier<bool> loading;
  final ValueNotifier<String?> error;
  UserRegistrationFormContext({
    required this.key,
    required this.name,
    required this.email,
    required this.password,
    required this.avatarFile,
    required this.loading,
    required this.error,
  });
}
