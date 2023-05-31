import 'package:freezed_annotation/freezed_annotation.dart';

part 'investment.g.dart';
part 'investment.freezed.dart';

@freezed
sealed class Investment with _$Investment {
  const factory Investment({
    required String startupId,
    required int amount,
    required DateTime date,
  }) = _Investment;

  factory Investment.fromJson(Map<String, Object?> json) =>
      _$InvestmentFromJson(json);
}
