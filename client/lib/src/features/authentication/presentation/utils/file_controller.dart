import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';

class FileController {
  File? chosenFile;
  FileController({this.chosenFile});
  void onChanged(File? file) {
    chosenFile = file;
  }
}

FileController useFileController([File? initialData]) {
  return useState(FileController(chosenFile: initialData)).value;
}
