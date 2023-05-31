// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvestmentsResponse _$$_InvestmentsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_InvestmentsResponse(
      investments: (json['investments'] as List<dynamic>)
          .map((e) => Investment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InvestmentsResponseToJson(
        _$_InvestmentsResponse instance) =>
    <String, dynamic>{
      'investments': instance.investments,
    };
