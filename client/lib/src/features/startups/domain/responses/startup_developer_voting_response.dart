import 'package:client/src/features/startups/domain/responses/startup_developer_voting_application_response.dart';
import 'package:client/src/features/startups/domain/responses/startup_developer_voting_max_approval_application_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_developer_voting_response.freezed.dart';
part 'startup_developer_voting_response.g.dart';

@freezed
class StartupDeveloperVotingResponse with _$StartupDeveloperVotingResponse {
  factory StartupDeveloperVotingResponse({
    required DateTime developerVotingDeadline,
    required int maxApproval,
    required Iterable<StartupDeveloperVotingMaxApprovalApplicationResponse>
        maxApprovalApplicationsDeveloper,
    required Iterable<StartupDeveloperVotingApplicationResponse>
        applicationsDeveloper,
  }) = _StartupDeveloperVotingResponse;

  factory StartupDeveloperVotingResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupDeveloperVotingResponseFromJson(json);
}
