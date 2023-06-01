// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_voting_confirm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeveloperVotingConfirmModel _$$_DeveloperVotingConfirmModelFromJson(
        Map<String, dynamic> json) =>
    _$_DeveloperVotingConfirmModel(
      developmentDeadline:
          DateTime.parse(json['developmentDeadline'] as String),
      applicationDeveloperId: json['applicationDeveloperId'] as String,
    );

Map<String, dynamic> _$$_DeveloperVotingConfirmModelToJson(
        _$_DeveloperVotingConfirmModel instance) =>
    <String, dynamic>{
      'developmentDeadline': instance.developmentDeadline.toIso8601String(),
      'applicationDeveloperId': instance.applicationDeveloperId,
    };
