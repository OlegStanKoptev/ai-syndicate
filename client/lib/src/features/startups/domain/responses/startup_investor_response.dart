import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_investor_response.freezed.dart';
part 'startup_investor_response.g.dart';

@freezed
class StartupInvestorResponse with _$StartupInvestorResponse {
  factory StartupInvestorResponse({
    required String id,
    required String fullName,
  }) = _StartupInvestorResponse;

  factory StartupInvestorResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupInvestorResponseFromJson(json);
}
