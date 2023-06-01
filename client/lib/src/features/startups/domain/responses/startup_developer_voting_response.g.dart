// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_developer_voting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupDeveloperVotingResponse _$$_StartupDeveloperVotingResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StartupDeveloperVotingResponse(
      developerVotingDeadline:
          DateTime.parse(json['developerVotingDeadline'] as String),
      maxApproval: json['maxApproval'] as int,
      maxApprovalApplicationsDeveloper:
          (json['maxApprovalApplicationsDeveloper'] as List<dynamic>).map((e) =>
              StartupDeveloperVotingMaxApprovalApplicationResponse.fromJson(
                  e as Map<String, dynamic>)),
      applicationsDeveloper: (json['applicationsDeveloper'] as List<dynamic>)
          .map((e) => StartupDeveloperVotingApplicationResponse.fromJson(
              e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_StartupDeveloperVotingResponseToJson(
        _$_StartupDeveloperVotingResponse instance) =>
    <String, dynamic>{
      'developerVotingDeadline':
          instance.developerVotingDeadline.toIso8601String(),
      'maxApproval': instance.maxApproval,
      'maxApprovalApplicationsDeveloper':
          instance.maxApprovalApplicationsDeveloper.toList(),
      'applicationsDeveloper': instance.applicationsDeveloper.toList(),
    };
