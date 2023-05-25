import 'dart:io';
import 'package:client/src/features/authentication/presentation/utils/file_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomImageFormField extends HookWidget {
  const CustomImageFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.hintText,
  });

  final FileController? controller;
  final String? Function(File?) validator;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final pickedFile = useState<File?>(null);
    final touched = useState(false);
    return FormField<File>(
      validator: validator,
      builder: (formFieldState) {
        return Column(
          children: [
            GestureDetector(
              onTapDown: (_) => touched.value = true,
              onTapUp: (_) => touched.value = false,
              onTapCancel: () => touched.value = false,
              onTap: () async {
                FilePickerResult? file = await FilePicker.platform
                    .pickFiles(type: FileType.image, allowMultiple: false);
                if (file != null) {
                  pickedFile.value = File(file.files.first.path!);
                  formFieldState.didChange(pickedFile.value!);
                  controller?.onChanged(pickedFile.value!);
                }
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff707070)
                      .withOpacity(touched.value ? 0.2 : 0.1),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.upload_file),
                    Text(
                      hintText ?? 'Upload Image',
                      style: TextStyle(
                        color: pickedFile.value != null ? Colors.green : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (formFieldState.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 10, bottom: 10),
                child: Text(
                  formFieldState.errorText!,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    color: Colors.red[700],
                    height: 0.5,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
