import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.g.dart';
part 'transaction_model.freezed.dart';

@freezed
sealed class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required int amount,
    required String investorId,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, Object?> json) =>
      _$TransactionModelFromJson(json);
}
