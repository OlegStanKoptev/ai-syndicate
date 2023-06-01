// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_development_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupDevelopmentResponse _$$_StartupDevelopmentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StartupDevelopmentResponse(
      developmentDeadline:
          DateTime.parse(json['developmentDeadline'] as String),
      reports: (json['reports'] as List<dynamic>).map((e) =>
          StartupDevelopmentReportResponse.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_StartupDevelopmentResponseToJson(
        _$_StartupDevelopmentResponse instance) =>
    <String, dynamic>{
      'developmentDeadline': instance.developmentDeadline.toIso8601String(),
      'reports': instance.reports.toList(),
    };
