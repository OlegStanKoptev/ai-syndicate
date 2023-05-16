import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(unionKey: 'role')
sealed class UserModel with _$UserModel {
  factory UserModel.admin(
    String id,
    String email,
    String fullName,
  ) = Admin;
  factory UserModel.developer(
    String id,
    String email,
    String fullName,
  ) = Developer;
  factory UserModel.expert(
    String id,
    String email,
    String fullName,
  ) = Expert;
  factory UserModel.user(
    String id,
    String email,
    String fullName,
    int balance,
  ) = User;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
