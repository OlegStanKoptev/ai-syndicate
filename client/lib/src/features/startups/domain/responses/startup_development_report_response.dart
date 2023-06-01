import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_development_report_response.freezed.dart';
part 'startup_development_report_response.g.dart';

@freezed
class StartupDevelopmentReportResponse with _$StartupDevelopmentReportResponse {
  factory StartupDevelopmentReportResponse({
    required String id,
    required String startupId,
    required String reportFile,
    required int yeas,
    required int nays,
  }) = _StartupDevelopmentReportResponse;

  factory StartupDevelopmentReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartupDevelopmentReportResponseFromJson(json);
}
