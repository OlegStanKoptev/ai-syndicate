import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(unionKey: 'role')
sealed class UserModel with _$UserModel {
  factory UserModel.admin({
    required String id,
    required String email,
    required String fullName,
  }) = Admin;
  factory UserModel.developer({
    required String id,
    required String email,
    required String fullName,
    required String phone,
    required String avatarImageFile,
    required String orgName,
    required String shortOrgName,
    required String inn,
    required String ogrn,
    required String kpp,
    required String legalAddress,
    required String actualAddress,
    required String website,
  }) = Developer;
  factory UserModel.expert({
    required String id,
    required String email,
    required String fullName,
  }) = Expert;
  factory UserModel.user({
    required String id,
    required String email,
    required String fullName,
    required String avatarImageFile,
    required int balance,
  }) = User;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
