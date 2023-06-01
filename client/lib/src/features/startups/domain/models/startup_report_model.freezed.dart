// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupReportModel _$StartupReportModelFromJson(Map<String, dynamic> json) {
  return _StartupReportModel.fromJson(json);
}

/// @nodoc
mixin _$StartupReportModel {
  String get startupId => throw _privateConstructorUsedError;
  String get reportFile => throw _privateConstructorUsedError;
  ShortStartupModel get startup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupReportModelCopyWith<StartupReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupReportModelCopyWith<$Res> {
  factory $StartupReportModelCopyWith(
          StartupReportModel value, $Res Function(StartupReportModel) then) =
      _$StartupReportModelCopyWithImpl<$Res, StartupReportModel>;
  @useResult
  $Res call({String startupId, String reportFile, ShortStartupModel startup});

  $ShortStartupModelCopyWith<$Res> get startup;
}

/// @nodoc
class _$StartupReportModelCopyWithImpl<$Res, $Val extends StartupReportModel>
    implements $StartupReportModelCopyWith<$Res> {
  _$StartupReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startupId = null,
    Object? reportFile = null,
    Object? startup = null,
  }) {
    return _then(_value.copyWith(
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      reportFile: null == reportFile
          ? _value.reportFile
          : reportFile // ignore: cast_nullable_to_non_nullable
              as String,
      startup: null == startup
          ? _value.startup
          : startup // ignore: cast_nullable_to_non_nullable
              as ShortStartupModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortStartupModelCopyWith<$Res> get startup {
    return $ShortStartupModelCopyWith<$Res>(_value.startup, (value) {
      return _then(_value.copyWith(startup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StartupReportModelCopyWith<$Res>
    implements $StartupReportModelCopyWith<$Res> {
  factory _$$_StartupReportModelCopyWith(_$_StartupReportModel value,
          $Res Function(_$_StartupReportModel) then) =
      __$$_StartupReportModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startupId, String reportFile, ShortStartupModel startup});

  @override
  $ShortStartupModelCopyWith<$Res> get startup;
}

/// @nodoc
class __$$_StartupReportModelCopyWithImpl<$Res>
    extends _$StartupReportModelCopyWithImpl<$Res, _$_StartupReportModel>
    implements _$$_StartupReportModelCopyWith<$Res> {
  __$$_StartupReportModelCopyWithImpl(
      _$_StartupReportModel _value, $Res Function(_$_StartupReportModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startupId = null,
    Object? reportFile = null,
    Object? startup = null,
  }) {
    return _then(_$_StartupReportModel(
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      reportFile: null == reportFile
          ? _value.reportFile
          : reportFile // ignore: cast_nullable_to_non_nullable
              as String,
      startup: null == startup
          ? _value.startup
          : startup // ignore: cast_nullable_to_non_nullable
              as ShortStartupModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupReportModel implements _StartupReportModel {
  _$_StartupReportModel(
      {required this.startupId,
      required this.reportFile,
      required this.startup});

  factory _$_StartupReportModel.fromJson(Map<String, dynamic> json) =>
      _$$_StartupReportModelFromJson(json);

  @override
  final String startupId;
  @override
  final String reportFile;
  @override
  final ShortStartupModel startup;

  @override
  String toString() {
    return 'StartupReportModel(startupId: $startupId, reportFile: $reportFile, startup: $startup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupReportModel &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.reportFile, reportFile) ||
                other.reportFile == reportFile) &&
            (identical(other.startup, startup) || other.startup == startup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startupId, reportFile, startup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupReportModelCopyWith<_$_StartupReportModel> get copyWith =>
      __$$_StartupReportModelCopyWithImpl<_$_StartupReportModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupReportModelToJson(
      this,
    );
  }
}

abstract class _StartupReportModel implements StartupReportModel {
  factory _StartupReportModel(
      {required final String startupId,
      required final String reportFile,
      required final ShortStartupModel startup}) = _$_StartupReportModel;

  factory _StartupReportModel.fromJson(Map<String, dynamic> json) =
      _$_StartupReportModel.fromJson;

  @override
  String get startupId;
  @override
  String get reportFile;
  @override
  ShortStartupModel get startup;
  @override
  @JsonKey(ignore: true)
  _$$_StartupReportModelCopyWith<_$_StartupReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
