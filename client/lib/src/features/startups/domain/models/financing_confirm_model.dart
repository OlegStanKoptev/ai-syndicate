import 'package:freezed_annotation/freezed_annotation.dart';

part 'financing_confirm_model.freezed.dart';
part 'financing_confirm_model.g.dart';

@freezed
class FinancingConfirmModel with _$FinancingConfirmModel {
  factory FinancingConfirmModel({
    required DateTime developerApplicationDeadline,
  }) = _FinancingConfirmModel;

  factory FinancingConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$FinancingConfirmModelFromJson(json);
}
