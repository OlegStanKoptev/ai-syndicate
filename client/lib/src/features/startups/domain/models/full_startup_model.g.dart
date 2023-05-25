// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_startup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullStartupModel _$$_FullStartupModelFromJson(Map<String, dynamic> json) =>
    _$_FullStartupModel(
      id: json['id'] as String,
      status: $enumDecode(_$StartupStatusEnumMap, json['status']),
      startuper: User.fromJson(json['startuper'] as Map<String, dynamic>),
      targetFinancing: json['targetFinancing'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      logoFile: json['logoFile'] as String?,
      specificationFile: json['specificationFile'] as String,
      businessPlanFile: json['businessPlanFile'] as String?,
      presentationFile: json['presentationFile'] as String?,
      verification: json['verification'] == null
          ? null
          : StartupVerificationResponse.fromJson(
              json['verification'] as Map<String, dynamic>),
      verificationFailed: json['verification_failed'] == null
          ? null
          : StartupVerificationFailedResponse.fromJson(
              json['verification_failed'] as Map<String, dynamic>),
      verificationSucceded:
          json['verification_succeded'] as Map<String, dynamic>?,
      financing: json['financing'] as Map<String, dynamic>?,
      financingFailed: json['financing_failed'] as Map<String, dynamic>?,
      financingSucceded: json['financing_succeded'] as Map<String, dynamic>?,
      developerApplication:
          json['developerApplication'] as Map<String, dynamic>?,
      developerVoting: json['developerVoting'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_FullStartupModelToJson(_$_FullStartupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$StartupStatusEnumMap[instance.status]!,
      'startuper': instance.startuper,
      'targetFinancing': instance.targetFinancing,
      'name': instance.name,
      'description': instance.description,
      'logoFile': instance.logoFile,
      'specificationFile': instance.specificationFile,
      'businessPlanFile': instance.businessPlanFile,
      'presentationFile': instance.presentationFile,
      'verification': instance.verification,
      'verification_failed': instance.verificationFailed,
      'verification_succeded': instance.verificationSucceded,
      'financing': instance.financing,
      'financing_failed': instance.financingFailed,
      'financing_succeded': instance.financingSucceded,
      'developerApplication': instance.developerApplication,
      'developerVoting': instance.developerVoting,
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
