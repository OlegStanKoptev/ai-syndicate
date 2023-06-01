import 'package:client/src/features/startups/domain/responses/startup_development_report_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_development_response.freezed.dart';
part 'startup_development_response.g.dart';

@freezed
class StartupDevelopmentResponse with _$StartupDevelopmentResponse {
  factory StartupDevelopmentResponse({
    required DateTime developmentDeadline,
    required Iterable<StartupDevelopmentReportResponse> reports,
  }) = _StartupDevelopmentResponse;

  factory StartupDevelopmentResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupDevelopmentResponseFromJson(json);
}
