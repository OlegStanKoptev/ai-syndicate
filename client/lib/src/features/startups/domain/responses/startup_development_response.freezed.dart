// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_development_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupDevelopmentResponse _$StartupDevelopmentResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupDevelopmentResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupDevelopmentResponse {
  DateTime get developmentDeadline => throw _privateConstructorUsedError;
  Iterable<StartupDevelopmentReportResponse> get reports =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupDevelopmentResponseCopyWith<StartupDevelopmentResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupDevelopmentResponseCopyWith<$Res> {
  factory $StartupDevelopmentResponseCopyWith(StartupDevelopmentResponse value,
          $Res Function(StartupDevelopmentResponse) then) =
      _$StartupDevelopmentResponseCopyWithImpl<$Res,
          StartupDevelopmentResponse>;
  @useResult
  $Res call(
      {DateTime developmentDeadline,
      Iterable<StartupDevelopmentReportResponse> reports});
}

/// @nodoc
class _$StartupDevelopmentResponseCopyWithImpl<$Res,
        $Val extends StartupDevelopmentResponse>
    implements $StartupDevelopmentResponseCopyWith<$Res> {
  _$StartupDevelopmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developmentDeadline = null,
    Object? reports = null,
  }) {
    return _then(_value.copyWith(
      developmentDeadline: null == developmentDeadline
          ? _value.developmentDeadline
          : developmentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reports: null == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as Iterable<StartupDevelopmentReportResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupDevelopmentResponseCopyWith<$Res>
    implements $StartupDevelopmentResponseCopyWith<$Res> {
  factory _$$_StartupDevelopmentResponseCopyWith(
          _$_StartupDevelopmentResponse value,
          $Res Function(_$_StartupDevelopmentResponse) then) =
      __$$_StartupDevelopmentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime developmentDeadline,
      Iterable<StartupDevelopmentReportResponse> reports});
}

/// @nodoc
class __$$_StartupDevelopmentResponseCopyWithImpl<$Res>
    extends _$StartupDevelopmentResponseCopyWithImpl<$Res,
        _$_StartupDevelopmentResponse>
    implements _$$_StartupDevelopmentResponseCopyWith<$Res> {
  __$$_StartupDevelopmentResponseCopyWithImpl(
      _$_StartupDevelopmentResponse _value,
      $Res Function(_$_StartupDevelopmentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developmentDeadline = null,
    Object? reports = null,
  }) {
    return _then(_$_StartupDevelopmentResponse(
      developmentDeadline: null == developmentDeadline
          ? _value.developmentDeadline
          : developmentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reports: null == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as Iterable<StartupDevelopmentReportResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupDevelopmentResponse implements _StartupDevelopmentResponse {
  _$_StartupDevelopmentResponse(
      {required this.developmentDeadline, required this.reports});

  factory _$_StartupDevelopmentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StartupDevelopmentResponseFromJson(json);

  @override
  final DateTime developmentDeadline;
  @override
  final Iterable<StartupDevelopmentReportResponse> reports;

  @override
  String toString() {
    return 'StartupDevelopmentResponse(developmentDeadline: $developmentDeadline, reports: $reports)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupDevelopmentResponse &&
            (identical(other.developmentDeadline, developmentDeadline) ||
                other.developmentDeadline == developmentDeadline) &&
            const DeepCollectionEquality().equals(other.reports, reports));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, developmentDeadline,
      const DeepCollectionEquality().hash(reports));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupDevelopmentResponseCopyWith<_$_StartupDevelopmentResponse>
      get copyWith => __$$_StartupDevelopmentResponseCopyWithImpl<
          _$_StartupDevelopmentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupDevelopmentResponseToJson(
      this,
    );
  }
}

abstract class _StartupDevelopmentResponse
    implements StartupDevelopmentResponse {
  factory _StartupDevelopmentResponse(
          {required final DateTime developmentDeadline,
          required final Iterable<StartupDevelopmentReportResponse> reports}) =
      _$_StartupDevelopmentResponse;

  factory _StartupDevelopmentResponse.fromJson(Map<String, dynamic> json) =
      _$_StartupDevelopmentResponse.fromJson;

  @override
  DateTime get developmentDeadline;
  @override
  Iterable<StartupDevelopmentReportResponse> get reports;
  @override
  @JsonKey(ignore: true)
  _$$_StartupDevelopmentResponseCopyWith<_$_StartupDevelopmentResponse>
      get copyWith => throw _privateConstructorUsedError;
}
