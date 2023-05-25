// ignore_for_file: constant_identifier_names

import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:client/src/features/startups/domain/responses/startup_verification_failed_response.dart';
import 'package:client/src/features/startups/domain/responses/startup_verification_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'full_startup_model.freezed.dart';
part 'full_startup_model.g.dart';

enum StartupStatus {
  verification,
  verification_failed,
  verification_succeded,
  financing,
  financing_failed,
  financing_succeded,
  developerApplication,
  developerApplication_succeded,
  developerVoting,
  developerVoting_succeded,
  development,
  development_succeded,
  finished
}

extension ParseToString on StartupStatus {
  String get description {
    switch (this) {
      case StartupStatus.verification:
      case StartupStatus.verification_failed:
      case StartupStatus.verification_succeded:
        return 'Verification';
      case StartupStatus.financing:
      case StartupStatus.financing_failed:
      case StartupStatus.financing_succeded:
        return 'Financing';
      case StartupStatus.developerApplication:
      case StartupStatus.developerApplication_succeded:
        return 'Hiring';
      case StartupStatus.developerVoting:
      case StartupStatus.developerVoting_succeded:
        return 'Preparing for development';
      case StartupStatus.development:
      case StartupStatus.development_succeded:
      case StartupStatus.finished:
        return 'Finished';
    }
  }
}

@freezed
class FullStartupModel with _$FullStartupModel {
  factory FullStartupModel({
    required String id,
    required StartupStatus status,
    required User startuper,
    required int targetFinancing,
    required String name,
    required String description,
    String? logoFile,
    required String specificationFile,
    String? businessPlanFile,
    String? presentationFile,
    StartupVerificationResponse? verification,
    @JsonKey(name: 'verification_failed')
        StartupVerificationFailedResponse? verificationFailed,
    @JsonKey(name: 'verification_succeded')
        Map<String, Object?>? verificationSucceded,
    Map<String, Object?>? financing,
    @JsonKey(name: 'financing_failed')
        Map<String, Object?>? financingFailed,
    @JsonKey(name: 'financing_succeded')
        Map<String, Object?>? financingSucceded,
    Map<String, Object?>? developerApplication,
    Map<String, Object?>? developerVoting,
  }) = _FullStartupModel;

  factory FullStartupModel.fromJson(Map<String, dynamic> json) =>
      _$FullStartupModelFromJson(json);
}
