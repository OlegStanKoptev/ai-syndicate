import 'package:client/src/features/authentication/presentation/widgets/custom_image_form_field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FileController {
  DataFile? chosenFile;
  FileController({this.chosenFile});
  void onChanged(DataFile? file) {
    chosenFile = file;
  }
}

FileController useFileController([DataFile? initialData]) {
  return useState(FileController(chosenFile: initialData)).value;
}
