import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_developer_model.g.dart';
part 'new_developer_model.freezed.dart';

@freezed
sealed class NewDeveloperModel with _$NewDeveloperModel {
  const factory NewDeveloperModel({
    required String email,
    required String password,
    required String phone,
    required String orgName,
    required String shortOrgName,
    required String inn,
    required String ogrn,
    required String kpp,
    required String legalAddress,
    required String actualAddress,
    required String website,
    String? avatarImageFile,
  }) = _NewDeveloperModel;

  factory NewDeveloperModel.fromJson(Map<String, Object?> json) =>
      _$NewDeveloperModelFromJson(json);
}
