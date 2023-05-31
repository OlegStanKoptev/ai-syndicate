import 'package:client/src/features/profile/domain/investment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'investments_response.g.dart';
part 'investments_response.freezed.dart';

@freezed
sealed class InvestmentsResponse with _$InvestmentsResponse {
  const factory InvestmentsResponse({
    required List<Investment> investments,
  }) = _InvestmentsResponse;

  factory InvestmentsResponse.fromJson(Map<String, Object?> json) =>
      _$InvestmentsResponseFromJson(json);
}
