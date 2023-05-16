// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupModel _$StartupModelFromJson(Map<String, dynamic> json) {
  return _StartupModel.fromJson(json);
}

/// @nodoc
mixin _$StartupModel {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupModelCopyWith<$Res> {
  factory $StartupModelCopyWith(
          StartupModel value, $Res Function(StartupModel) then) =
      _$StartupModelCopyWithImpl<$Res, StartupModel>;
}

/// @nodoc
class _$StartupModelCopyWithImpl<$Res, $Val extends StartupModel>
    implements $StartupModelCopyWith<$Res> {
  _$StartupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartupModelCopyWith<$Res> {
  factory _$$_StartupModelCopyWith(
          _$_StartupModel value, $Res Function(_$_StartupModel) then) =
      __$$_StartupModelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartupModelCopyWithImpl<$Res>
    extends _$StartupModelCopyWithImpl<$Res, _$_StartupModel>
    implements _$$_StartupModelCopyWith<$Res> {
  __$$_StartupModelCopyWithImpl(
      _$_StartupModel _value, $Res Function(_$_StartupModel) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_StartupModel with DiagnosticableTreeMixin implements _StartupModel {
  _$_StartupModel();

  factory _$_StartupModel.fromJson(Map<String, dynamic> json) =>
      _$$_StartupModelFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartupModel()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'StartupModel'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StartupModel);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupModelToJson(
      this,
    );
  }
}

abstract class _StartupModel implements StartupModel {
  factory _StartupModel() = _$_StartupModel;

  factory _StartupModel.fromJson(Map<String, dynamic> json) =
      _$_StartupModel.fromJson;
}
