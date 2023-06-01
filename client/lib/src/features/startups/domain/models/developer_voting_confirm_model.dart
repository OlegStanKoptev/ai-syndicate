import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_voting_confirm_model.freezed.dart';
part 'developer_voting_confirm_model.g.dart';

@freezed
class DeveloperVotingConfirmModel with _$DeveloperVotingConfirmModel {
  factory DeveloperVotingConfirmModel({
    required DateTime developmentDeadline,
    required String applicationDeveloperId,
  }) = _DeveloperVotingConfirmModel;

  factory DeveloperVotingConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperVotingConfirmModelFromJson(json);
}
