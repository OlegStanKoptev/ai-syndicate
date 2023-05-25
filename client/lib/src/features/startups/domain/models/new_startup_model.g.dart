// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_startup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewStartupModel _$$_NewStartupModelFromJson(Map<String, dynamic> json) =>
    _$_NewStartupModel(
      name: json['name'] as String,
      description: json['description'] as String,
      logoFile: json['logoFile'] as String?,
      specificationFile: json['specificationFile'] as String,
      businessPlanFile: json['businessPlanFile'] as String?,
      presentationFile: json['presentationFile'] as String?,
      targetFinancing: json['targetFinancing'] as int,
    );

Map<String, dynamic> _$$_NewStartupModelToJson(_$_NewStartupModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'logoFile': instance.logoFile,
      'specificationFile': instance.specificationFile,
      'businessPlanFile': instance.businessPlanFile,
      'presentationFile': instance.presentationFile,
      'targetFinancing': instance.targetFinancing,
    };
