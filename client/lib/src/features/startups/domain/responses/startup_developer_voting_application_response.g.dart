// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_developer_voting_application_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupDeveloperVotingApplicationResponse
    _$$_StartupDeveloperVotingApplicationResponseFromJson(
            Map<String, dynamic> json) =>
        _$_StartupDeveloperVotingApplicationResponse(
          id: json['id'] as String,
          startupId: json['startupId'] as String,
          developerId: json['developerId'] as String,
          message: json['message'] as String,
          developer:
              Developer.fromJson(json['developer'] as Map<String, dynamic>),
          approval: (json['approval'] as num).toDouble(),
        );

Map<String, dynamic> _$$_StartupDeveloperVotingApplicationResponseToJson(
        _$_StartupDeveloperVotingApplicationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startupId': instance.startupId,
      'developerId': instance.developerId,
      'message': instance.message,
      'developer': instance.developer,
      'approval': instance.approval,
    };
