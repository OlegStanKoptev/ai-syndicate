// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_startup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShortStartupModel _$$_ShortStartupModelFromJson(Map<String, dynamic> json) =>
    _$_ShortStartupModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: $enumDecode(_$StartupStatusEnumMap, json['status']),
      startuperId: json['startuperId'] as String,
      targetFinancing: json['targetFinancing'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      logoFile: json['logoFile'] as String?,
      specificationFile: json['specificationFile'] as String,
      businessPlanFile: json['businessPlanFile'] as String?,
      presentationFile: json['presentationFile'] as String?,
      developerId: json['developerId'] as String?,
      currentReportId: json['currentReportId'] as String?,
      verificationEndedAt: json['verificationEndedAt'] == null
          ? null
          : DateTime.parse(json['verificationEndedAt'] as String),
      financingEndedAt: json['financingEndedAt'] == null
          ? null
          : DateTime.parse(json['financingEndedAt'] as String),
      developerApplicationEndedAt: json['developerApplicationEndedAt'] == null
          ? null
          : DateTime.parse(json['developerApplicationEndedAt'] as String),
      developerVotingEndedAt: json['developerVotingEndedAt'] == null
          ? null
          : DateTime.parse(json['developerVotingEndedAt'] as String),
      developmentEndedAt: json['developmentEndedAt'] == null
          ? null
          : DateTime.parse(json['developmentEndedAt'] as String),
      finishedAt: json['finishedAt'] == null
          ? null
          : DateTime.parse(json['finishedAt'] as String),
      financingDeadline: json['financingDeadline'] == null
          ? null
          : DateTime.parse(json['financingDeadline'] as String),
      developerApplicationDeadline: json['developerApplicationDeadline'] == null
          ? null
          : DateTime.parse(json['developerApplicationDeadline'] as String),
      developerVotingDeadline: json['developerVotingDeadline'] == null
          ? null
          : DateTime.parse(json['developerVotingDeadline'] as String),
      developmentDeadline: json['developmentDeadline'] == null
          ? null
          : DateTime.parse(json['developmentDeadline'] as String),
    );

Map<String, dynamic> _$$_ShortStartupModelToJson(
        _$_ShortStartupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'status': _$StartupStatusEnumMap[instance.status]!,
      'startuperId': instance.startuperId,
      'targetFinancing': instance.targetFinancing,
      'name': instance.name,
      'description': instance.description,
      'logoFile': instance.logoFile,
      'specificationFile': instance.specificationFile,
      'businessPlanFile': instance.businessPlanFile,
      'presentationFile': instance.presentationFile,
      'developerId': instance.developerId,
      'currentReportId': instance.currentReportId,
      'verificationEndedAt': instance.verificationEndedAt?.toIso8601String(),
      'financingEndedAt': instance.financingEndedAt?.toIso8601String(),
      'developerApplicationEndedAt':
          instance.developerApplicationEndedAt?.toIso8601String(),
      'developerVotingEndedAt':
          instance.developerVotingEndedAt?.toIso8601String(),
      'developmentEndedAt': instance.developmentEndedAt?.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'financingDeadline': instance.financingDeadline?.toIso8601String(),
      'developerApplicationDeadline':
          instance.developerApplicationDeadline?.toIso8601String(),
      'developerVotingDeadline':
          instance.developerVotingDeadline?.toIso8601String(),
      'developmentDeadline': instance.developmentDeadline?.toIso8601String(),
    };

const _$StartupStatusEnumMap = {
  StartupStatus.verification: 'verification',
  StartupStatus.verification_failed: 'verification_failed',
  StartupStatus.verification_succeded: 'verification_succeded',
  StartupStatus.financing: 'financing',
  StartupStatus.financing_failed: 'financing_failed',
  StartupStatus.financing_succeded: 'financing_succeded',
  StartupStatus.developerApplication: 'developerApplication',
  StartupStatus.developerApplication_succeded: 'developerApplication_succeded',
  StartupStatus.developerVoting: 'developerVoting',
  StartupStatus.developerVoting_succeded: 'developerVoting_succeded',
  StartupStatus.development: 'development',
  StartupStatus.development_succeded: 'development_succeded',
  StartupStatus.finished: 'finished',
};
