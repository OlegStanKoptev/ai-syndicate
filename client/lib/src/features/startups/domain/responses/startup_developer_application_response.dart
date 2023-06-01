import 'package:client/src/features/startups/domain/responses/startup_developer_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_developer_application_response.freezed.dart';
part 'startup_developer_application_response.g.dart';

@freezed
class StartupDeveloperApplicationResponse
    with _$StartupDeveloperApplicationResponse {
  factory StartupDeveloperApplicationResponse({
    required String id,
    required String message,
    required StartupDeveloperResponse developer,
  }) = _StartupDeveloperApplicationResponse;

  factory StartupDeveloperApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartupDeveloperApplicationResponseFromJson(json);
}
