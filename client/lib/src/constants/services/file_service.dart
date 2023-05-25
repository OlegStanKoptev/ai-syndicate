import 'dart:async';
import 'dart:io';

import 'package:client/src/constants/client.dart';
import 'package:client/src/utils/file_extension.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_service.g.dart';
part 'file_service.freezed.dart';

@freezed
sealed class FileModel with _$FileModel {
  const factory FileModel(String file) = _FileModel;

  factory FileModel.fromJson(Map<String, Object?> json) =>
      _$FileModelFromJson(json);
}

class FileService {
  Uri getFileUrl({required String fileName}) =>
      Uri.parse('${dio.options.baseUrl}/files/$fileName');

  FutureOr<String?> uploadFile({required File? file}) async {
    if (file != null) {
      final multipartFile =
          await MultipartFile.fromFile(file.path, filename: file.name);
      final response = await dio.post(
        '/api/file/new',
        data: FormData.fromMap({'file': multipartFile}),
      );
      return FileModel.fromJson(response.data).file;
    }
    return null;
  }
}
