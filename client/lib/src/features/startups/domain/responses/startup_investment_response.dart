import 'package:client/src/features/startups/domain/responses/startup_investor_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_investment_response.freezed.dart';
part 'startup_investment_response.g.dart';

@freezed
class StartupInvestmentResponse with _$StartupInvestmentResponse {
  factory StartupInvestmentResponse({
    required StartupInvestorResponse investor,
    required int amount,
  }) = _StartupInvestmentResponse;

  factory StartupInvestmentResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupInvestmentResponseFromJson(json);
}
