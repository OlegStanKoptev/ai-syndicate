// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_developer_voting_max_approval_application_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupDeveloperVotingMaxApprovalApplicationResponse
    _$$_StartupDeveloperVotingMaxApprovalApplicationResponseFromJson(
            Map<String, dynamic> json) =>
        _$_StartupDeveloperVotingMaxApprovalApplicationResponse(
          id: json['id'] as String,
          startupId: json['startupId'] as String,
          developerId: json['developerId'] as String,
          message: json['message'] as String,
          developer:
              Developer.fromJson(json['developer'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_StartupDeveloperVotingMaxApprovalApplicationResponseToJson(
            _$_StartupDeveloperVotingMaxApprovalApplicationResponse instance) =>
        <String, dynamic>{
          'id': instance.id,
          'startupId': instance.startupId,
          'developerId': instance.developerId,
          'message': instance.message,
          'developer': instance.developer,
        };
