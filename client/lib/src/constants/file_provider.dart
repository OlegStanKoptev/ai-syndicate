import 'package:client/src/constants/dio_provider.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_provider.g.dart';
part 'file_provider.freezed.dart';

@freezed
sealed class FileModel with _$FileModel {
  const factory FileModel(String file) = _FileModel;

  factory FileModel.fromJson(Map<String, Object?> json) =>
      _$FileModelFromJson(json);
}

class FileRepository {
  FileRepository(this.client);
  final Dio client;

  Future<String> uploadFile(
      {required String filePath, required String fileName}) async {
    final file = await MultipartFile.fromFile(filePath, filename: fileName);
    final response = await client.post(
      '/api/file/new',
      data: FormData.fromMap({'file': file}),
    );
    return FileModel.fromJson(response.data).file;
  }
}

@Riverpod(keepAlive: true)
FileRepository fileRepository(FileRepositoryRef ref) =>
    FileRepository(ref.watch(dioProvider));

@riverpod
String fileUrl(FileUrlRef ref, {required String fileName}) =>
    '${ref.read(dioProvider).options.baseUrl}/files/$fileName';
