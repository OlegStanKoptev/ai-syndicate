// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_verification_vote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupVerificationVoteModel _$$_StartupVerificationVoteModelFromJson(
        Map<String, dynamic> json) =>
    _$_StartupVerificationVoteModel(
      id: json['id'] as String,
      nayReason: json['nayReason'] as String,
      expert: Expert.fromJson(json['expert'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StartupVerificationVoteModelToJson(
        _$_StartupVerificationVoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nayReason': instance.nayReason,
      'expert': instance.expert,
    };
