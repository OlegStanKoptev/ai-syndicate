import 'package:client/src/constants/file_provider.dart';
import 'package:client/src/features/authentication/application/auth_provider.dart';
import 'package:client/src/features/authentication/domain/new_user_model.dart';
import 'package:client/src/features/authentication/presentation/utils/file_controller.dart';
import 'package:client/src/features/authentication/presentation/utils/file_extension.dart';
import 'package:client/src/features/authentication/presentation/utils/string_extension.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_image_form_field.dart';
import 'package:client/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserRegisterFormContext {
  final GlobalKey<FormState> key;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final FileController avatarFile;
  UserRegisterFormContext({
    required this.key,
    required this.name,
    required this.email,
    required this.password,
    required this.avatarFile,
  });
}

class UserRegisterPage extends HookConsumerWidget {
  const UserRegisterPage({super.key});

  void submit(UserRegisterFormContext formContext, WidgetRef ref) async {
    if (!formContext.key.currentState!.validate()) return;
    final file = formContext.avatarFile.chosenFile;
    String? fileId = file != null
        ? await ref
            .read(fileRepositoryProvider)
            .uploadFile(filePath: file.path, fileName: file.name)
        : null;
    final user = NewUserModel(
        email: formContext.email.text,
        fullName: formContext.name.text,
        avatarImageFile: fileId,
        password: formContext.password.text);
    await ref.read(authRepositoryProvider).joinAsUser(user: user);
    ref.read(goRouterProvider).goNamed('auth');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formContext = UserRegisterFormContext(
      key: useMemoized(GlobalKey<FormState>.new, const []),
      name: useTextEditingController(),
      email: useTextEditingController(),
      password: useTextEditingController(),
      avatarFile: useFileController(),
    );
    return SingleChildScrollView(
      child: Form(
        key: formContext.key,
        child: Column(
          children: [
            CustomFormField(
              controller: formContext.name,
              hintText: 'Full Name',
              validator: (val) => val != null && val.isValidName
                  ? null
                  : 'Enter valid full name',
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
              validator: (val) => val != null && val.isValidPassword
                  ? null
                  : 'Enter valid password',
            ),
            CustomImageFormField(
              controller: formContext.avatarFile,
              validator: (_) => null,
            ),
            ElevatedButton(
              onPressed: () => submit(formContext, ref),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
