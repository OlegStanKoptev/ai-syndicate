// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_development_report_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupDevelopmentReportResponse _$StartupDevelopmentReportResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupDevelopmentReportResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupDevelopmentReportResponse {
  String get id => throw _privateConstructorUsedError;
  String get startupId => throw _privateConstructorUsedError;
  String get reportFile => throw _privateConstructorUsedError;
  int get yeas => throw _privateConstructorUsedError;
  int get nays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupDevelopmentReportResponseCopyWith<StartupDevelopmentReportResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupDevelopmentReportResponseCopyWith<$Res> {
  factory $StartupDevelopmentReportResponseCopyWith(
          StartupDevelopmentReportResponse value,
          $Res Function(StartupDevelopmentReportResponse) then) =
      _$StartupDevelopmentReportResponseCopyWithImpl<$Res,
          StartupDevelopmentReportResponse>;
  @useResult
  $Res call(
      {String id, String startupId, String reportFile, int yeas, int nays});
}

/// @nodoc
class _$StartupDevelopmentReportResponseCopyWithImpl<$Res,
        $Val extends StartupDevelopmentReportResponse>
    implements $StartupDevelopmentReportResponseCopyWith<$Res> {
  _$StartupDevelopmentReportResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? reportFile = null,
    Object? yeas = null,
    Object? nays = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      reportFile: null == reportFile
          ? _value.reportFile
          : reportFile // ignore: cast_nullable_to_non_nullable
              as String,
      yeas: null == yeas
          ? _value.yeas
          : yeas // ignore: cast_nullable_to_non_nullable
              as int,
      nays: null == nays
          ? _value.nays
          : nays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupDevelopmentReportResponseCopyWith<$Res>
    implements $StartupDevelopmentReportResponseCopyWith<$Res> {
  factory _$$_StartupDevelopmentReportResponseCopyWith(
          _$_StartupDevelopmentReportResponse value,
          $Res Function(_$_StartupDevelopmentReportResponse) then) =
      __$$_StartupDevelopmentReportResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String startupId, String reportFile, int yeas, int nays});
}

/// @nodoc
class __$$_StartupDevelopmentReportResponseCopyWithImpl<$Res>
    extends _$StartupDevelopmentReportResponseCopyWithImpl<$Res,
        _$_StartupDevelopmentReportResponse>
    implements _$$_StartupDevelopmentReportResponseCopyWith<$Res> {
  __$$_StartupDevelopmentReportResponseCopyWithImpl(
      _$_StartupDevelopmentReportResponse _value,
      $Res Function(_$_StartupDevelopmentReportResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? reportFile = null,
    Object? yeas = null,
    Object? nays = null,
  }) {
    return _then(_$_StartupDevelopmentReportResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      reportFile: null == reportFile
          ? _value.reportFile
          : reportFile // ignore: cast_nullable_to_non_nullable
              as String,
      yeas: null == yeas
          ? _value.yeas
          : yeas // ignore: cast_nullable_to_non_nullable
              as int,
      nays: null == nays
          ? _value.nays
          : nays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupDevelopmentReportResponse
    implements _StartupDevelopmentReportResponse {
  _$_StartupDevelopmentReportResponse(
      {required this.id,
      required this.startupId,
      required this.reportFile,
      required this.yeas,
      required this.nays});

  factory _$_StartupDevelopmentReportResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_StartupDevelopmentReportResponseFromJson(json);

  @override
  final String id;
  @override
  final String startupId;
  @override
  final String reportFile;
  @override
  final int yeas;
  @override
  final int nays;

  @override
  String toString() {
    return 'StartupDevelopmentReportResponse(id: $id, startupId: $startupId, reportFile: $reportFile, yeas: $yeas, nays: $nays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupDevelopmentReportResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.reportFile, reportFile) ||
                other.reportFile == reportFile) &&
            (identical(other.yeas, yeas) || other.yeas == yeas) &&
            (identical(other.nays, nays) || other.nays == nays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startupId, reportFile, yeas, nays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupDevelopmentReportResponseCopyWith<
          _$_StartupDevelopmentReportResponse>
      get copyWith => __$$_StartupDevelopmentReportResponseCopyWithImpl<
          _$_StartupDevelopmentReportResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupDevelopmentReportResponseToJson(
      this,
    );
  }
}

abstract class _StartupDevelopmentReportResponse
    implements StartupDevelopmentReportResponse {
  factory _StartupDevelopmentReportResponse(
      {required final String id,
      required final String startupId,
      required final String reportFile,
      required final int yeas,
      required final int nays}) = _$_StartupDevelopmentReportResponse;

  factory _StartupDevelopmentReportResponse.fromJson(
      Map<String, dynamic> json) = _$_StartupDevelopmentReportResponse.fromJson;

  @override
  String get id;
  @override
  String get startupId;
  @override
  String get reportFile;
  @override
  int get yeas;
  @override
  int get nays;
  @override
  @JsonKey(ignore: true)
  _$$_StartupDevelopmentReportResponseCopyWith<
          _$_StartupDevelopmentReportResponse>
      get copyWith => throw _privateConstructorUsedError;
}
