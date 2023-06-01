// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_development_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupDevelopmentReportResponse
    _$$_StartupDevelopmentReportResponseFromJson(Map<String, dynamic> json) =>
        _$_StartupDevelopmentReportResponse(
          id: json['id'] as String,
          startupId: json['startupId'] as String,
          reportFile: json['reportFile'] as String,
          yeas: json['yeas'] as int,
          nays: json['nays'] as int,
        );

Map<String, dynamic> _$$_StartupDevelopmentReportResponseToJson(
        _$_StartupDevelopmentReportResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startupId': instance.startupId,
      'reportFile': instance.reportFile,
      'yeas': instance.yeas,
      'nays': instance.nays,
    };
