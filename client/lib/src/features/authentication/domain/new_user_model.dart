import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_user_model.g.dart';
part 'new_user_model.freezed.dart';

@freezed
sealed class NewUserModel with _$NewUserModel {
  const factory NewUserModel({
    required String email,
    required String fullName,
    required String? avatarImageFile,
    required String password,
  }) = _NewUserModel;

  factory NewUserModel.fromJson(Map<String, Object?> json) =>
      _$NewUserModelFromJson(json);
}
