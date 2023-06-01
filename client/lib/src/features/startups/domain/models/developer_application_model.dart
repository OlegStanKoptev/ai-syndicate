import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_application_model.freezed.dart';
part 'developer_application_model.g.dart';

@freezed
class DeveloperApplicationModel with _$DeveloperApplicationModel {
  factory DeveloperApplicationModel({
    required String id,
    required String startupId,
    required String developerId,
    required String message,
    ShortStartupModel? startup,
  }) = _DeveloperApplicationModel;

  factory DeveloperApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperApplicationModelFromJson(json);
}
