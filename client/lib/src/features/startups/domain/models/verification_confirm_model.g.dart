// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_confirm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VerificationConfirmModel _$$_VerificationConfirmModelFromJson(
        Map<String, dynamic> json) =>
    _$_VerificationConfirmModel(
      financingDeadline: DateTime.parse(json['financingDeadline'] as String),
    );

Map<String, dynamic> _$$_VerificationConfirmModelToJson(
        _$_VerificationConfirmModel instance) =>
    <String, dynamic>{
      'financingDeadline': instance.financingDeadline.toIso8601String(),
    };
