import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_model.freezed.dart';
part 'verification_model.g.dart';

@freezed
sealed class VerificationModel with _$VerificationModel {
  const factory VerificationModel.yea() = Yea;
  const factory VerificationModel.nay({
    required String reason,
  }) = Nay;

  factory VerificationModel.fromJson(Map<String, Object?> json) =>
      _$VerificationModelFromJson(json);
}
