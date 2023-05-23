// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewUserModel _$$_NewUserModelFromJson(Map<String, dynamic> json) =>
    _$_NewUserModel(
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      avatarImageFile: json['avatarImageFile'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_NewUserModelToJson(_$_NewUserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'avatarImageFile': instance.avatarImageFile,
      'password': instance.password,
    };
