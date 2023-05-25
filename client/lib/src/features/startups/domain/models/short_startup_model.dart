import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'short_startup_model.freezed.dart';
part 'short_startup_model.g.dart';

@freezed
class ShortStartupModel with _$ShortStartupModel {
  factory ShortStartupModel({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required StartupStatus status,
    required String startuperId,
    required int targetFinancing,
    required String name,
    required String description,
    String? logoFile,
    required String specificationFile,
    String? businessPlanFile,
    String? presentationFile,
    String? developerId,
    String? currentReportId,
    DateTime? verificationEndedAt,
    DateTime? financingEndedAt,
    DateTime? developerApplicationEndedAt,
    DateTime? developerVotingEndedAt,
    DateTime? developmentEndedAt,
    DateTime? finishedAt,
    DateTime? financingDeadline,
    DateTime? developerApplicationDeadline,
    DateTime? developerVotingDeadline,
    DateTime? developmentDeadline,
  }) = _ShortStartupModel;

  factory ShortStartupModel.fromJson(Map<String, dynamic> json) =>
      _$ShortStartupModelFromJson(json);
}
