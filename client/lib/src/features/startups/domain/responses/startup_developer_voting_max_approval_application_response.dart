import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_developer_voting_max_approval_application_response.freezed.dart';
part 'startup_developer_voting_max_approval_application_response.g.dart';

@freezed
class StartupDeveloperVotingMaxApprovalApplicationResponse
    with _$StartupDeveloperVotingMaxApprovalApplicationResponse {
  factory StartupDeveloperVotingMaxApprovalApplicationResponse({
    required String id,
    required String startupId,
    required String developerId,
    required String message,
    required Developer developer,
  }) = _StartupDeveloperVotingMaxApprovalApplicationResponse;

  factory StartupDeveloperVotingMaxApprovalApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartupDeveloperVotingMaxApprovalApplicationResponseFromJson(json);
}
