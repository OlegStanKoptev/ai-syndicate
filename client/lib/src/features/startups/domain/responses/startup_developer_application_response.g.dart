// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_developer_application_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupDeveloperApplicationResponse
    _$$_StartupDeveloperApplicationResponseFromJson(
            Map<String, dynamic> json) =>
        _$_StartupDeveloperApplicationResponse(
          id: json['id'] as String,
          message: json['message'] as String,
          developer: StartupDeveloperResponse.fromJson(
              json['developer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_StartupDeveloperApplicationResponseToJson(
        _$_StartupDeveloperApplicationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'developer': instance.developer,
    };
