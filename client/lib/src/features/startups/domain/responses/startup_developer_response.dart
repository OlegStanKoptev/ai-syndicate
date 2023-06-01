import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_developer_response.freezed.dart';
part 'startup_developer_response.g.dart';

@freezed
class StartupDeveloperResponse with _$StartupDeveloperResponse {
  factory StartupDeveloperResponse({
    required String id,
    required String shortOrgName,
    required String email,
  }) = _StartupDeveloperResponse;

  factory StartupDeveloperResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupDeveloperResponseFromJson(json);
}
