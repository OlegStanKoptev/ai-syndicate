import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_confirm_model.freezed.dart';
part 'verification_confirm_model.g.dart';

@freezed
class VerificationConfirmModel with _$VerificationConfirmModel {
  factory VerificationConfirmModel({
    required DateTime financingDeadline,
  }) = _VerificationConfirmModel;

  factory VerificationConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationConfirmModelFromJson(json);
}
