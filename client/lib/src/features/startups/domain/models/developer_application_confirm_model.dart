import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_application_confirm_model.freezed.dart';
part 'developer_application_confirm_model.g.dart';

@freezed
class DeveloperApplicationConfirmModel with _$DeveloperApplicationConfirmModel {
  factory DeveloperApplicationConfirmModel({
    required DateTime developerVotingDeadline,
  }) = _DeveloperApplicationConfirmModel;

  factory DeveloperApplicationConfirmModel.fromJson(
          Map<String, dynamic> json) =>
      _$DeveloperApplicationConfirmModelFromJson(json);
}
