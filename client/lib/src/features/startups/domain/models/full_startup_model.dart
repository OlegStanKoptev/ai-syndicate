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
  String get description => switch (this) {
        StartupStatus.verification => "Verification",
        StartupStatus.verification_failed => "Failed Verification",
        StartupStatus.verification_succeded => "Verified",
        StartupStatus.financing => "Financing",
        StartupStatus.financing_failed => "Underfunded",
        StartupStatus.financing_succeded => "Funded",
        StartupStatus.developerApplication => "Hiring",
        StartupStatus.developerApplication_succeded => "Finished hiring",
        StartupStatus.developerVoting => "Choosing a developer",
        StartupStatus.developerVoting_succeded => "Invited a developer",
        StartupStatus.development => "In development",
        StartupStatus.development_succeded => "Finished developing",
        StartupStatus.finished => "Completed",
      };
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
