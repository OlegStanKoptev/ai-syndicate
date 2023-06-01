import 'package:client/src/features/startups/domain/responses/startup_developer_application_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_developer_applications_response.freezed.dart';
part 'startup_developer_applications_response.g.dart';

@freezed
class StartupDeveloperApplicationsResponse
    with _$StartupDeveloperApplicationsResponse {
  factory StartupDeveloperApplicationsResponse({
    required DateTime developerApplicationDeadline,
    required Iterable<StartupDeveloperApplicationResponse> applications,
  }) = _StartupDeveloperApplicationsResponse;

  factory StartupDeveloperApplicationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartupDeveloperApplicationsResponseFromJson(json);
}
