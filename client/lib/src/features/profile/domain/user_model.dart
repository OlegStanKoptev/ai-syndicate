import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(unionKey: 'role')
sealed class UserModel with _$UserModel {
  const factory UserModel.admin({
    required String id,
    required String email,
    required String fullName,
  }) = Admin;
  const factory UserModel.developer({
    required String id,
    required String email,
    required String fullName,
    required String phone,
    String? avatarImageFile,
    required String orgName,
    required String shortOrgName,
    required String inn,
    required String ogrn,
    required String kpp,
    required String legalAddress,
    required String actualAddress,
    required String website,
  }) = Developer;
  const factory UserModel.expert({
    required String id,
    required String email,
    required String fullName,
  }) = Expert;
  const factory UserModel.user({
    required String id,
    required String email,
    required String fullName,
    String? avatarImageFile,
    int? balance,
  }) = User;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
