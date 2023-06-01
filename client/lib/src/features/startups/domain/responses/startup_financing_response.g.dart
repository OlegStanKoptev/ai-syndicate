// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_financing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupFinancingResponse _$$_StartupFinancingResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StartupFinancingResponse(
      financingDeadline: DateTime.parse(json['financingDeadline'] as String),
      investmentsTotal: json['investmentsTotal'] as int,
      investments: (json['investments'] as List<dynamic>).map(
          (e) => StartupInvestmentResponse.fromJson(e as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_StartupFinancingResponseToJson(
        _$_StartupFinancingResponse instance) =>
    <String, dynamic>{
      'financingDeadline': instance.financingDeadline.toIso8601String(),
      'investmentsTotal': instance.investmentsTotal,
      'investments': instance.investments.toList(),
    };
