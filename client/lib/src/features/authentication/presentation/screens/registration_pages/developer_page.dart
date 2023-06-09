import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/authentication/application/auth_service.dart';
import 'package:client/src/features/authentication/domain/new_developer_model.dart';
import 'package:client/src/features/authentication/presentation/utils/file_controller.dart';
import 'package:client/src/features/authentication/presentation/utils/string_extension.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_image_form_field.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class DeveloperRegisterPage extends HookWidget {
  const DeveloperRegisterPage({super.key});

  void submit(
    BuildContext context,
    DeveloperRegistrationFormContext formContext,
  ) async {
    if (formContext.key.currentState!.validate()) {
      try {
        formContext.loading.value = true;
        await Provider.of<AuthService>(context, listen: false).joinAsDeveloper(
          developer: NewDeveloperModel(
            email: formContext.email.text,
            password: formContext.password.text,
            avatarImageFile:
                await Provider.of<FileService>(context, listen: false)
                    .uploadFile(file: formContext.avatarFile.chosenFile),
            phone: formContext.phone.text,
            orgName: formContext.orgName.text,
            shortOrgName: formContext.shortOrgName.text,
            inn: formContext.inn.text,
            ogrn: formContext.ogrn.text,
            kpp: formContext.kpp.text,
            legalAddress: formContext.legalAddress.text,
            actualAddress: formContext.actualAddress.text,
            website: formContext.website.text,
          ),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'You have successfully sent a request! Please await a email with details',
            ),
          ));
          const HomeRoute().go(context);
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
    final formContext = DeveloperRegistrationFormContext(
      key: useMemoized(GlobalKey<FormState>.new, const []),
      avatarFile: useFileController(),
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
      loading: useState(false),
      error: useState(null),
    );
    return Form(
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
            obscureText: true,
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
            validator: (val) => val != null && val.length == 10
                ? null
                : 'Enter valid INN (10 symbols)',
          ),
          CustomFormField(
            controller: formContext.ogrn,
            hintText: 'OGRN',
            validator: (val) => val != null && val.length == 13
                ? null
                : 'Enter valid OGRN (13 symbols)',
          ),
          CustomFormField(
            controller: formContext.kpp,
            hintText: 'KPP',
            validator: (val) => val != null && val.length == 9
                ? null
                : 'Enter valid KPP (9 symbols)',
          ),
          CustomFormField(
            controller: formContext.legalAddress,
            hintText: 'Legal Address',
            validator: (val) => val != null ? null : 'Enter valid address',
          ),
          CustomFormField(
            controller: formContext.actualAddress,
            hintText: 'Actual Address',
            validator: (val) =>
                val != null && val.isNotEmpty ? null : 'Enter valid address',
          ),
          CustomFormField(
            controller: formContext.website,
            hintText: 'Website',
            validator: (val) => val != null && val.isNotEmpty
                ? null
                : 'Enter valid website name',
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
                : const Text('Send registration request'),
          )
        ],
      ),
    );
  }
}

class DeveloperRegistrationFormContext {
  final GlobalKey<FormState> key;
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
  final ValueNotifier<bool> loading;
  final ValueNotifier<String?> error;
  DeveloperRegistrationFormContext({
    required this.key,
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
    required this.loading,
    required this.error,
  });
}
