import 'package:client/src/features/profile/domain/investment.dart';
import 'package:client/src/features/startups/domain/models/developer_application_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/vote_model.dart';
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
    String? phone,
    String? avatarImageFile,
    required String orgName,
    required String shortOrgName,
    required String inn,
    required String ogrn,
    required String kpp,
    String? legalAddress,
    required String actualAddress,
    required String website,
    Iterable<DeveloperApplicationModel>? applicationsDeveloper,
  }) = Developer;
  const factory UserModel.expert({
    required String id,
    required String email,
    required String fullName,
    Iterable<StartupVote>? votesNewStartup,
    Iterable<ReportVote>? votesReport,
  }) = Expert;
  const factory UserModel.user({
    required String id,
    required String email,
    required String fullName,
    String? avatarImageFile,
    int? balance,
    Iterable<FullStartupModel>? startupsCreated,
    Iterable<Investment>? investments,
  }) = User;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
