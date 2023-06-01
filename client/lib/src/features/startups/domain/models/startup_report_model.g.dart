// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupReportModel _$$_StartupReportModelFromJson(
        Map<String, dynamic> json) =>
    _$_StartupReportModel(
      startupId: json['startupId'] as String,
      reportFile: json['reportFile'] as String,
      startup:
          ShortStartupModel.fromJson(json['startup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StartupReportModelToJson(
        _$_StartupReportModel instance) =>
    <String, dynamic>{
      'startupId': instance.startupId,
      'reportFile': instance.reportFile,
      'startup': instance.startup,
    };
