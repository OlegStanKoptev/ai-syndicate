// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Admin _$$AdminFromJson(Map<String, dynamic> json) => _$Admin(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$AdminToJson(_$Admin instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'role': instance.$type,
    };

_$Developer _$$DeveloperFromJson(Map<String, dynamic> json) => _$Developer(
      id: json['id'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      avatarImageFile: json['avatarImageFile'] as String?,
      orgName: json['orgName'] as String,
      shortOrgName: json['shortOrgName'] as String,
      inn: json['inn'] as String,
      ogrn: json['ogrn'] as String,
      kpp: json['kpp'] as String,
      legalAddress: json['legalAddress'] as String?,
      actualAddress: json['actualAddress'] as String,
      website: json['website'] as String,
      applicationsDeveloper: (json['applicationsDeveloper'] as List<dynamic>?)
          ?.map((e) =>
              DeveloperApplicationModel.fromJson(e as Map<String, dynamic>)),
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$DeveloperToJson(_$Developer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'avatarImageFile': instance.avatarImageFile,
      'orgName': instance.orgName,
      'shortOrgName': instance.shortOrgName,
      'inn': instance.inn,
      'ogrn': instance.ogrn,
      'kpp': instance.kpp,
      'legalAddress': instance.legalAddress,
      'actualAddress': instance.actualAddress,
      'website': instance.website,
      'applicationsDeveloper': instance.applicationsDeveloper?.toList(),
      'role': instance.$type,
    };

_$Expert _$$ExpertFromJson(Map<String, dynamic> json) => _$Expert(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      votesNewStartup: (json['votesNewStartup'] as List<dynamic>?)
          ?.map((e) => StartupVote.fromJson(e as Map<String, dynamic>)),
      votesReport: (json['votesReport'] as List<dynamic>?)
          ?.map((e) => ReportVote.fromJson(e as Map<String, dynamic>)),
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$ExpertToJson(_$Expert instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'votesNewStartup': instance.votesNewStartup?.toList(),
      'votesReport': instance.votesReport?.toList(),
      'role': instance.$type,
    };

_$User _$$UserFromJson(Map<String, dynamic> json) => _$User(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      avatarImageFile: json['avatarImageFile'] as String?,
      balance: json['balance'] as int?,
      startupsCreated: (json['startupsCreated'] as List<dynamic>?)
          ?.map((e) => FullStartupModel.fromJson(e as Map<String, dynamic>)),
      investments: (json['investments'] as List<dynamic>?)
          ?.map((e) => Investment.fromJson(e as Map<String, dynamic>)),
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$UserToJson(_$User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'avatarImageFile': instance.avatarImageFile,
      'balance': instance.balance,
      'startupsCreated': instance.startupsCreated?.toList(),
      'investments': instance.investments?.toList(),
      'role': instance.$type,
    };
