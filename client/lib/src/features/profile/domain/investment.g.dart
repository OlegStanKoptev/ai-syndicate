// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Investment _$$_InvestmentFromJson(Map<String, dynamic> json) =>
    _$_Investment(
      startupId: json['startupId'] as String,
      amount: json['amount'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_InvestmentToJson(_$_Investment instance) =>
    <String, dynamic>{
      'startupId': instance.startupId,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
