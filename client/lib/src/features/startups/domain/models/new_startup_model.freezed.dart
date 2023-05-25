// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_startup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewStartupModel _$NewStartupModelFromJson(Map<String, dynamic> json) {
  return _NewStartupModel.fromJson(json);
}

/// @nodoc
mixin _$NewStartupModel {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get logoFile => throw _privateConstructorUsedError;
  String get specificationFile => throw _privateConstructorUsedError;
  String? get businessPlanFile => throw _privateConstructorUsedError;
  String? get presentationFile => throw _privateConstructorUsedError;
  int get targetFinancing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewStartupModelCopyWith<NewStartupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewStartupModelCopyWith<$Res> {
  factory $NewStartupModelCopyWith(
          NewStartupModel value, $Res Function(NewStartupModel) then) =
      _$NewStartupModelCopyWithImpl<$Res, NewStartupModel>;
  @useResult
  $Res call(
      {String name,
      String description,
      String? logoFile,
      String specificationFile,
      String? businessPlanFile,
      String? presentationFile,
      int targetFinancing});
}

/// @nodoc
class _$NewStartupModelCopyWithImpl<$Res, $Val extends NewStartupModel>
    implements $NewStartupModelCopyWith<$Res> {
  _$NewStartupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? logoFile = freezed,
    Object? specificationFile = null,
    Object? businessPlanFile = freezed,
    Object? presentationFile = freezed,
    Object? targetFinancing = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as String?,
      specificationFile: null == specificationFile
          ? _value.specificationFile
          : specificationFile // ignore: cast_nullable_to_non_nullable
              as String,
      businessPlanFile: freezed == businessPlanFile
          ? _value.businessPlanFile
          : businessPlanFile // ignore: cast_nullable_to_non_nullable
              as String?,
      presentationFile: freezed == presentationFile
          ? _value.presentationFile
          : presentationFile // ignore: cast_nullable_to_non_nullable
              as String?,
      targetFinancing: null == targetFinancing
          ? _value.targetFinancing
          : targetFinancing // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewStartupModelCopyWith<$Res>
    implements $NewStartupModelCopyWith<$Res> {
  factory _$$_NewStartupModelCopyWith(
          _$_NewStartupModel value, $Res Function(_$_NewStartupModel) then) =
      __$$_NewStartupModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String? logoFile,
      String specificationFile,
      String? businessPlanFile,
      String? presentationFile,
      int targetFinancing});
}

/// @nodoc
class __$$_NewStartupModelCopyWithImpl<$Res>
    extends _$NewStartupModelCopyWithImpl<$Res, _$_NewStartupModel>
    implements _$$_NewStartupModelCopyWith<$Res> {
  __$$_NewStartupModelCopyWithImpl(
      _$_NewStartupModel _value, $Res Function(_$_NewStartupModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? logoFile = freezed,
    Object? specificationFile = null,
    Object? businessPlanFile = freezed,
    Object? presentationFile = freezed,
    Object? targetFinancing = null,
  }) {
    return _then(_$_NewStartupModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as String?,
      specificationFile: null == specificationFile
          ? _value.specificationFile
          : specificationFile // ignore: cast_nullable_to_non_nullable
              as String,
      businessPlanFile: freezed == businessPlanFile
          ? _value.businessPlanFile
          : businessPlanFile // ignore: cast_nullable_to_non_nullable
              as String?,
      presentationFile: freezed == presentationFile
          ? _value.presentationFile
          : presentationFile // ignore: cast_nullable_to_non_nullable
              as String?,
      targetFinancing: null == targetFinancing
          ? _value.targetFinancing
          : targetFinancing // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewStartupModel implements _NewStartupModel {
  _$_NewStartupModel(
      {required this.name,
      required this.description,
      this.logoFile,
      required this.specificationFile,
      this.businessPlanFile,
      this.presentationFile,
      required this.targetFinancing});

  factory _$_NewStartupModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewStartupModelFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String? logoFile;
  @override
  final String specificationFile;
  @override
  final String? businessPlanFile;
  @override
  final String? presentationFile;
  @override
  final int targetFinancing;

  @override
  String toString() {
    return 'NewStartupModel(name: $name, description: $description, logoFile: $logoFile, specificationFile: $specificationFile, businessPlanFile: $businessPlanFile, presentationFile: $presentationFile, targetFinancing: $targetFinancing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewStartupModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logoFile, logoFile) ||
                other.logoFile == logoFile) &&
            (identical(other.specificationFile, specificationFile) ||
                other.specificationFile == specificationFile) &&
            (identical(other.businessPlanFile, businessPlanFile) ||
                other.businessPlanFile == businessPlanFile) &&
            (identical(other.presentationFile, presentationFile) ||
                other.presentationFile == presentationFile) &&
            (identical(other.targetFinancing, targetFinancing) ||
                other.targetFinancing == targetFinancing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, logoFile,
      specificationFile, businessPlanFile, presentationFile, targetFinancing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewStartupModelCopyWith<_$_NewStartupModel> get copyWith =>
      __$$_NewStartupModelCopyWithImpl<_$_NewStartupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewStartupModelToJson(
      this,
    );
  }
}

abstract class _NewStartupModel implements NewStartupModel {
  factory _NewStartupModel(
      {required final String name,
      required final String description,
      final String? logoFile,
      required final String specificationFile,
      final String? businessPlanFile,
      final String? presentationFile,
      required final int targetFinancing}) = _$_NewStartupModel;

  factory _NewStartupModel.fromJson(Map<String, dynamic> json) =
      _$_NewStartupModel.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String? get logoFile;
  @override
  String get specificationFile;
  @override
  String? get businessPlanFile;
  @override
  String? get presentationFile;
  @override
  int get targetFinancing;
  @override
  @JsonKey(ignore: true)
  _$$_NewStartupModelCopyWith<_$_NewStartupModel> get copyWith =>
      throw _privateConstructorUsedError;
}
