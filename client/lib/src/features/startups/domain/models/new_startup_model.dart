import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_startup_model.freezed.dart';
part 'new_startup_model.g.dart';

@freezed
class NewStartupModel with _$NewStartupModel {
  factory NewStartupModel({
    required String name,
    required String description,
    String? logoFile,
    required String specificationFile,
    String? businessPlanFile,
    String? presentationFile,
    required int targetFinancing,
  }) = _NewStartupModel;

  factory NewStartupModel.fromJson(Map<String, dynamic> json) =>
      _$NewStartupModelFromJson(json);
}
