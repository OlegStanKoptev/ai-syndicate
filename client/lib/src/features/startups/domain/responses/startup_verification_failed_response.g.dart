// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_verification_failed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupVerificationFailedResponse
    _$$_StartupVerificationFailedResponseFromJson(Map<String, dynamic> json) =>
        _$_StartupVerificationFailedResponse(
          nayVotes: (json['nayVotes'] as List<dynamic>)
              .map((e) => StartupVerificationVoteModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_StartupVerificationFailedResponseToJson(
        _$_StartupVerificationFailedResponse instance) =>
    <String, dynamic>{
      'nayVotes': instance.nayVotes,
    };
