import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_startup_response.freezed.dart';
part 'new_startup_response.g.dart';

@freezed
class NewStartupResponse with _$NewStartupResponse {
  factory NewStartupResponse({
    required String id,
  }) = _NewStartupResponse;

  factory NewStartupResponse.fromJson(Map<String, dynamic> json) =>
      _$NewStartupResponseFromJson(json);
}
