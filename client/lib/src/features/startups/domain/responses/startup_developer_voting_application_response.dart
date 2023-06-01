import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_developer_voting_application_response.freezed.dart';
part 'startup_developer_voting_application_response.g.dart';

@freezed
class StartupDeveloperVotingApplicationResponse
    with _$StartupDeveloperVotingApplicationResponse {
  factory StartupDeveloperVotingApplicationResponse({
    required String id,
    required String startupId,
    required String developerId,
    required String message,
    required Developer developer,
    required double approval,
  }) = _StartupDeveloperVotingApplicationResponse;

  factory StartupDeveloperVotingApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartupDeveloperVotingApplicationResponseFromJson(json);
}
