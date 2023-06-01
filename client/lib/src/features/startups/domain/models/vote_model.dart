import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:client/src/features/startups/domain/models/startup_report_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_model.freezed.dart';
part 'vote_model.g.dart';

@freezed
sealed class VoteModel with _$VoteModel {
  const factory VoteModel.startupVote({
    required bool yea,
    String? nayReason,
    String? expertId,
    String? startupId,
    ShortStartupModel? startup,
  }) = StartupVote;
  const factory VoteModel.reportVote({
    required bool yea,
    String? nayReason,
    String? expertId,
    String? reportId,
    StartupReportModel? report,
  }) = ReportVote;

  factory VoteModel.fromJson(Map<String, Object?> json) =>
      _$VoteModelFromJson(json);
}
