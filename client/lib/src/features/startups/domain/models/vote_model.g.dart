// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartupVote _$$StartupVoteFromJson(Map<String, dynamic> json) =>
    _$StartupVote(
      yea: json['yea'] as bool,
      nayReason: json['nayReason'] as String?,
      expertId: json['expertId'] as String?,
      startupId: json['startupId'] as String?,
      startup: json['startup'] == null
          ? null
          : ShortStartupModel.fromJson(json['startup'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$StartupVoteToJson(_$StartupVote instance) =>
    <String, dynamic>{
      'yea': instance.yea,
      'nayReason': instance.nayReason,
      'expertId': instance.expertId,
      'startupId': instance.startupId,
      'startup': instance.startup,
      'runtimeType': instance.$type,
    };

_$ReportVote _$$ReportVoteFromJson(Map<String, dynamic> json) => _$ReportVote(
      yea: json['yea'] as bool,
      nayReason: json['nayReason'] as String?,
      expertId: json['expertId'] as String?,
      reportId: json['reportId'] as String?,
      report: json['report'] == null
          ? null
          : StartupReportModel.fromJson(json['report'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReportVoteToJson(_$ReportVote instance) =>
    <String, dynamic>{
      'yea': instance.yea,
      'nayReason': instance.nayReason,
      'expertId': instance.expertId,
      'reportId': instance.reportId,
      'report': instance.report,
      'runtimeType': instance.$type,
    };
