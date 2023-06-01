import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_report_model.freezed.dart';
part 'startup_report_model.g.dart';

@freezed
class StartupReportModel with _$StartupReportModel {
  factory StartupReportModel({
    required String startupId,
    required String reportFile,
    required ShortStartupModel startup,
  }) = _StartupReportModel;

  factory StartupReportModel.fromJson(Map<String, dynamic> json) =>
      _$StartupReportModelFromJson(json);
}
