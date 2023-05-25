import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/authentication/presentation/utils/file_controller.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_form_field.dart';
import 'package:client/src/features/authentication/presentation/widgets/custom_image_form_field.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/features/startups/domain/models/new_startup_model.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class NewStartupScreen extends HookWidget {
  const NewStartupScreen({super.key});

  void submit(
    BuildContext context,
    NewStartupFormContext formContext,
  ) async {
    if (formContext.key.currentState!.validate()) {
      try {
        formContext.loading.value = true;
        await Provider.of<StartupService>(context, listen: false)
            .createNewStartup(
          newStartup: NewStartupModel(
            name: formContext.name.text,
            description: formContext.description.text,
            logoFile: await Provider.of<FileService>(context, listen: false)
                .uploadFile(file: formContext.logoFile.chosenFile),
            specificationFile: (await Provider.of<FileService>(context,
                    listen: false)
                .uploadFile(file: formContext.specificationFile.chosenFile))!,
            businessPlanFile:
                await Provider.of<FileService>(context, listen: false)
                    .uploadFile(file: formContext.businessPlanFile.chosenFile),
            presentationFile:
                await Provider.of<FileService>(context, listen: false)
                    .uploadFile(file: formContext.presentationFile.chosenFile),
            targetFinancing: int.parse(formContext.targetFinancing.text),
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
    final formContext = NewStartupFormContext(
      key: useMemoized(GlobalKey<FormState>.new, const []),
      name: useTextEditingController(),
      description: useTextEditingController(),
      logoFile: useFileController(),
      specificationFile: useFileController(),
      businessPlanFile: useFileController(),
      presentationFile: useFileController(),
      targetFinancing: useTextEditingController(),
      loading: useState(false),
      error: useState(null),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('New Startup')),
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
                    controller: formContext.name,
                    hintText: 'Name',
                    validator: (val) =>
                        val != null ? null : 'Enter valid full name',
                  ),
                  CustomFormField(
                    controller: formContext.description,
                    hintText: 'Description',
                    validator: (val) =>
                        val != null ? null : 'Enter valid description',
                  ),
                  CustomFormField(
                    controller: formContext.description,
                    hintText: 'Description',
                    validator: (val) =>
                        val != null ? null : 'Enter valid description',
                  ),
                  CustomImageFormField(
                    controller: formContext.logoFile,
                    hintText: 'Logo',
                    validator: (_) => null,
                  ),
                  CustomImageFormField(
                    controller: formContext.specificationFile,
                    hintText: 'Specifications',
                    validator: (file) =>
                        file != null ? null : 'Choose valid specification file',
                  ),
                  CustomImageFormField(
                    controller: formContext.businessPlanFile,
                    hintText: 'Business Plan',
                    validator: (_) => null,
                  ),
                  CustomImageFormField(
                    controller: formContext.businessPlanFile,
                    hintText: 'Business Plan',
                    validator: (_) => null,
                  ),
                  CustomImageFormField(
                    controller: formContext.presentationFile,
                    hintText: 'Presentation',
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
            ),
          ),
        ),
      ),
    );
  }
}

class NewStartupFormContext {
  final GlobalKey<FormState> key;
  final TextEditingController name;
  final TextEditingController description;
  final FileController logoFile;
  final FileController specificationFile;
  final FileController businessPlanFile;
  final FileController presentationFile;
  final TextEditingController targetFinancing;
  final ValueNotifier<bool> loading;
  final ValueNotifier<String?> error;
  NewStartupFormContext({
    required this.key,
    required this.name,
    required this.description,
    required this.logoFile,
    required this.specificationFile,
    required this.businessPlanFile,
    required this.presentationFile,
    required this.targetFinancing,
    required this.loading,
    required this.error,
  });
}
