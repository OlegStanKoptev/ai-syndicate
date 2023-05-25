import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_response.g.dart';
part 'deposit_response.freezed.dart';

@freezed
sealed class DepositResponse with _$DepositResponse {
  const factory DepositResponse({
    required int balance,
  }) = _DepositResponse;

  factory DepositResponse.fromJson(Map<String, Object?> json) =>
      _$DepositResponseFromJson(json);
}
