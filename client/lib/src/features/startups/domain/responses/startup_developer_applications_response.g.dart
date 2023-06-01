// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_developer_applications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupDeveloperApplicationsResponse
    _$$_StartupDeveloperApplicationsResponseFromJson(
            Map<String, dynamic> json) =>
        _$_StartupDeveloperApplicationsResponse(
          developerApplicationDeadline:
              DateTime.parse(json['developerApplicationDeadline'] as String),
          applications: (json['applications'] as List<dynamic>).map((e) =>
              StartupDeveloperApplicationResponse.fromJson(
                  e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$$_StartupDeveloperApplicationsResponseToJson(
        _$_StartupDeveloperApplicationsResponse instance) =>
    <String, dynamic>{
      'developerApplicationDeadline':
          instance.developerApplicationDeadline.toIso8601String(),
      'applications': instance.applications.toList(),
    };
