// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Investment _$$_InvestmentFromJson(Map<String, dynamic> json) =>
    _$_Investment(
      id: json['id'] as String,
      startupId: json['startupId'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$_InvestmentToJson(_$_Investment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startupId': instance.startupId,
      'amount': instance.amount,
    };
