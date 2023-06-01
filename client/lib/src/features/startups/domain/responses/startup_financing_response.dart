import 'package:client/src/features/profile/domain/investment.dart';
import 'package:client/src/features/startups/domain/responses/startup_investment_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_financing_response.freezed.dart';
part 'startup_financing_response.g.dart';

@freezed
class StartupFinancingResponse with _$StartupFinancingResponse {
  factory StartupFinancingResponse({
    required DateTime financingDeadline,
    required int investmentsTotal,
    required Iterable<StartupInvestmentResponse> investments,
  }) = _StartupFinancingResponse;

  factory StartupFinancingResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupFinancingResponseFromJson(json);
}
