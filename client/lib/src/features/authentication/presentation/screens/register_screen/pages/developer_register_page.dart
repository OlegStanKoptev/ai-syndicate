import 'package:client/src/constants/file_provider.dart';
import 'package:client/src/features/authentication/application/auth_provider.dart';
import 'package:client/src/features/authentication/domain/new_developer_model.dart';
import 'package:client/src/features/authentication/presentation/utils/file_controller.dart';
import 'package:client/src/features/authentication/presentation/utils/file_extension.dart';
import 'package:client/src/features/authentication/presentation/utils/string_extension.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_image_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeveloperRegisterFormContext {
  final GlobalKey<FormState> key;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController phone;
  final TextEditingController orgName;
  final TextEditingController shortOrgName;
  final TextEditingController inn;
  final TextEditingController ogrn;
  final TextEditingController kpp;
  final TextEditingController legalAddress;
  final TextEditingController actualAddress;
  final TextEditingController website;
  final FileController avatarFile;
  DeveloperRegisterFormContext({
    required this.key,
    required this.name,
    required this.email,
    required this.password,
    required this.avatarFile,
    required this.phone,
    required this.orgName,
    required this.shortOrgName,
    required this.inn,
    required this.ogrn,
    required this.kpp,
    required this.legalAddress,
    required this.actualAddress,
    required this.website,
  });
}

class DeveloperRegisterPage extends HookConsumerWidget {
  const DeveloperRegisterPage({super.key});

  void submit(DeveloperRegisterFormContext formContext, WidgetRef ref) async {
    if (!formContext.key.currentState!.validate()) return;
    final file = formContext.avatarFile.chosenFile;
    String? fileId = file != null
        ? await ref
            .read(fileRepositoryProvider)
            .uploadFile(filePath: file.path, fileName: file.name)
        : null;
    final developer = NewDeveloperModel(
      email: formContext.email.text,
      password: formContext.password.text,
      avatarImageFile: fileId,
      fullName: formContext.name.text,
      phone: formContext.phone.text,
      orgName: formContext.orgName.text,
      shortOrgName: formContext.shortOrgName.text,
      inn: formContext.inn.text,
      ogrn: formContext.ogrn.text,
      kpp: formContext.kpp.text,
      legalAddress: formContext.legalAddress.text,
      actualAddress: formContext.actualAddress.text,
      website: formContext.website.text,
    );
    await ref
        .read(authRepositoryProvider)
        .joinAsDeveloper(developer: developer);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formContext = DeveloperRegisterFormContext(
      key: useMemoized(GlobalKey<FormState>.new, const []),
      avatarFile: useFileController(),
      name: useTextEditingController(),
      email: useTextEditingController(),
      password: useTextEditingController(),
      phone: useTextEditingController(),
      orgName: useTextEditingController(),
      shortOrgName: useTextEditingController(),
      inn: useTextEditingController(),
      ogrn: useTextEditingController(),
      kpp: useTextEditingController(),
      legalAddress: useTextEditingController(),
      actualAddress: useTextEditingController(),
      website: useTextEditingController(),
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
            CustomFormField(
              controller: formContext.phone,
              hintText: 'Phone',
              validator: (val) =>
                  val != null && val.isValidPhone ? null : 'Enter valid phone',
            ),
            CustomFormField(
              controller: formContext.orgName,
              hintText: 'Full Organization Name',
              validator: (val) =>
                  val != null ? null : 'Enter valid organization name',
            ),
            CustomFormField(
              controller: formContext.shortOrgName,
              hintText: 'Short Organization Name',
              validator: (val) =>
                  val != null ? null : 'Enter valid organization name',
            ),
            CustomFormField(
              controller: formContext.inn,
              hintText: 'INN',
              validator: (val) => val != null ? null : 'Enter valid INN',
            ),
            CustomFormField(
              controller: formContext.ogrn,
              hintText: 'OGRN',
              validator: (val) => val != null ? null : 'Enter valid OGRN',
            ),
            CustomFormField(
              controller: formContext.kpp,
              hintText: 'KPP',
              validator: (val) => val != null ? null : 'Enter valid KPP',
            ),
            CustomFormField(
              controller: formContext.legalAddress,
              hintText: 'Legal Address',
              validator: (val) => val != null ? null : 'Enter valid address',
            ),
            CustomFormField(
              controller: formContext.actualAddress,
              hintText: 'Actual Address',
              validator: (val) => val != null ? null : 'Enter valid address',
            ),
            CustomFormField(
              controller: formContext.website,
              hintText: 'Website',
              validator: (val) =>
                  val != null ? null : 'Enter valid website name',
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
