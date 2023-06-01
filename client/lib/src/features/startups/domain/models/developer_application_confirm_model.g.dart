// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_application_confirm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeveloperApplicationConfirmModel
    _$$_DeveloperApplicationConfirmModelFromJson(Map<String, dynamic> json) =>
        _$_DeveloperApplicationConfirmModel(
          developerVotingDeadline:
              DateTime.parse(json['developerVotingDeadline'] as String),
        );

Map<String, dynamic> _$$_DeveloperApplicationConfirmModelToJson(
        _$_DeveloperApplicationConfirmModel instance) =>
    <String, dynamic>{
      'developerVotingDeadline':
          instance.developerVotingDeadline.toIso8601String(),
    };
