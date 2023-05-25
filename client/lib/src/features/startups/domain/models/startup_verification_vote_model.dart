import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_verification_vote_model.freezed.dart';
part 'startup_verification_vote_model.g.dart';

@freezed
class StartupVerificationVoteModel with _$StartupVerificationVoteModel {
  factory StartupVerificationVoteModel({
    required String id,
    required String nayReason,
    required Expert expert,
  }) = _StartupVerificationVoteModel;

  factory StartupVerificationVoteModel.fromJson(Map<String, dynamic> json) =>
      _$StartupVerificationVoteModelFromJson(json);
}
