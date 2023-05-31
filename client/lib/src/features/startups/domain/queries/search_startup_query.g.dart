// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_startup_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchStartupsQuery _$$_SearchStartupsQueryFromJson(
        Map<String, dynamic> json) =>
    _$_SearchStartupsQuery(
      page: json['page'] as int?,
      size: json['size'] as int?,
      status: $enumDecodeNullable(_$StartupStatusEnumMap, json['status']),
      startuperId: json['startuperId'] as String?,
    );

Map<String, dynamic> _$$_SearchStartupsQueryToJson(
    _$_SearchStartupsQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page', instance.page);
  writeNotNull('size', instance.size);
  writeNotNull('status', _$StartupStatusEnumMap[instance.status]);
  writeNotNull('startuperId', instance.startuperId);
  return val;
}

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
