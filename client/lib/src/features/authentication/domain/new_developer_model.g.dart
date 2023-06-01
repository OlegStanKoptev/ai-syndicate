// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_developer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewDeveloperModel _$$_NewDeveloperModelFromJson(Map<String, dynamic> json) =>
    _$_NewDeveloperModel(
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      orgName: json['orgName'] as String,
      shortOrgName: json['shortOrgName'] as String,
      inn: json['inn'] as String,
      ogrn: json['ogrn'] as String,
      kpp: json['kpp'] as String,
      legalAddress: json['legalAddress'] as String,
      actualAddress: json['actualAddress'] as String,
      website: json['website'] as String,
      avatarImageFile: json['avatarImageFile'] as String?,
    );

Map<String, dynamic> _$$_NewDeveloperModelToJson(
        _$_NewDeveloperModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'orgName': instance.orgName,
      'shortOrgName': instance.shortOrgName,
      'inn': instance.inn,
      'ogrn': instance.ogrn,
      'kpp': instance.kpp,
      'legalAddress': instance.legalAddress,
      'actualAddress': instance.actualAddress,
      'website': instance.website,
      'avatarImageFile': instance.avatarImageFile,
    };
