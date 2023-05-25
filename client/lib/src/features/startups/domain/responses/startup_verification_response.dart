import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_verification_response.freezed.dart';
part 'startup_verification_response.g.dart';

@freezed
class StartupVerificationResponse with _$StartupVerificationResponse {
  factory StartupVerificationResponse({
    required int yeasTotal,
    required int naysTotal,
  }) = _StartupVerificationResponse;

  factory StartupVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupVerificationResponseFromJson(json);
}
