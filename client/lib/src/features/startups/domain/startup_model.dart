import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'startup_model.freezed.dart';
part 'startup_model.g.dart';

@freezed
class StartupModel with _$StartupModel {
  factory StartupModel() = _StartupModel;

  factory StartupModel.fromJson(Map<String, dynamic> json) =>
      _$StartupModelFromJson(json);
}
