import 'package:client/src/features/startups/domain/models/startup_vote_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_verification_failed_response.freezed.dart';
part 'startup_verification_failed_response.g.dart';

@freezed
class StartupVerificationFailedResponse
    with _$StartupVerificationFailedResponse {
  factory StartupVerificationFailedResponse({
    required List<StartupVerificationVoteModel> nayVotes,
  }) = _StartupVerificationFailedResponse;

  factory StartupVerificationFailedResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartupVerificationFailedResponseFromJson(json);
}
