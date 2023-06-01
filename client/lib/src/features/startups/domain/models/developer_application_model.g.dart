// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeveloperApplicationModel _$$_DeveloperApplicationModelFromJson(
        Map<String, dynamic> json) =>
    _$_DeveloperApplicationModel(
      id: json['id'] as String,
      startupId: json['startupId'] as String,
      developerId: json['developerId'] as String,
      message: json['message'] as String,
      startup: json['startup'] == null
          ? null
          : ShortStartupModel.fromJson(json['startup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeveloperApplicationModelToJson(
        _$_DeveloperApplicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startupId': instance.startupId,
      'developerId': instance.developerId,
      'message': instance.message,
      'startup': instance.startup,
    };
