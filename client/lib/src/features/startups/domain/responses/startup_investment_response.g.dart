// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_investment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartupInvestmentResponse _$$_StartupInvestmentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StartupInvestmentResponse(
      investor: StartupInvestorResponse.fromJson(
          json['investor'] as Map<String, dynamic>),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$_StartupInvestmentResponseToJson(
        _$_StartupInvestmentResponse instance) =>
    <String, dynamic>{
      'investor': instance.investor,
      'amount': instance.amount,
    };
