// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Admin _$$AdminFromJson(Map<String, dynamic> json) => _$Admin(
      json['id'] as String,
      json['email'] as String,
      json['fullName'] as String,
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$AdminToJson(_$Admin instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'role': instance.$type,
    };

_$Developer _$$DeveloperFromJson(Map<String, dynamic> json) => _$Developer(
      json['id'] as String,
      json['email'] as String,
      json['fullName'] as String,
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$DeveloperToJson(_$Developer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'role': instance.$type,
    };

_$Expert _$$ExpertFromJson(Map<String, dynamic> json) => _$Expert(
      json['id'] as String,
      json['email'] as String,
      json['fullName'] as String,
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$ExpertToJson(_$Expert instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'role': instance.$type,
    };

_$User _$$UserFromJson(Map<String, dynamic> json) => _$User(
      json['id'] as String,
      json['email'] as String,
      json['fullName'] as String,
      json['balance'] as int,
      $type: json['role'] as String?,
    );

Map<String, dynamic> _$$UserToJson(_$User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'balance': instance.balance,
      'role': instance.$type,
    };
