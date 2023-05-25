// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_startup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchStartupResponse _$$_SearchStartupResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchStartupResponse(
      size: json['size'] as int,
      page: json['page'] as int,
      total: json['total'] as int,
      totalPages: json['totalPages'] as int,
      from: json['from'] as int,
      to: json['to'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => ShortStartupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      logoFile: json['logoFile'] as String?,
    );

Map<String, dynamic> _$$_SearchStartupResponseToJson(
        _$_SearchStartupResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'from': instance.from,
      'to': instance.to,
      'data': instance.data,
      'logoFile': instance.logoFile,
    };
