// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_developer_applications_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupDeveloperApplicationsResponse
    _$StartupDeveloperApplicationsResponseFromJson(Map<String, dynamic> json) {
  return _StartupDeveloperApplicationsResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupDeveloperApplicationsResponse {
  DateTime get developerApplicationDeadline =>
      throw _privateConstructorUsedError;
  Iterable<StartupDeveloperApplicationResponse> get applications =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupDeveloperApplicationsResponseCopyWith<
          StartupDeveloperApplicationsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupDeveloperApplicationsResponseCopyWith<$Res> {
  factory $StartupDeveloperApplicationsResponseCopyWith(
          StartupDeveloperApplicationsResponse value,
          $Res Function(StartupDeveloperApplicationsResponse) then) =
      _$StartupDeveloperApplicationsResponseCopyWithImpl<$Res,
          StartupDeveloperApplicationsResponse>;
  @useResult
  $Res call(
      {DateTime developerApplicationDeadline,
      Iterable<StartupDeveloperApplicationResponse> applications});
}

/// @nodoc
class _$StartupDeveloperApplicationsResponseCopyWithImpl<$Res,
        $Val extends StartupDeveloperApplicationsResponse>
    implements $StartupDeveloperApplicationsResponseCopyWith<$Res> {
  _$StartupDeveloperApplicationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developerApplicationDeadline = null,
    Object? applications = null,
  }) {
    return _then(_value.copyWith(
      developerApplicationDeadline: null == developerApplicationDeadline
          ? _value.developerApplicationDeadline
          : developerApplicationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applications: null == applications
          ? _value.applications
          : applications // ignore: cast_nullable_to_non_nullable
              as Iterable<StartupDeveloperApplicationResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupDeveloperApplicationsResponseCopyWith<$Res>
    implements $StartupDeveloperApplicationsResponseCopyWith<$Res> {
  factory _$$_StartupDeveloperApplicationsResponseCopyWith(
          _$_StartupDeveloperApplicationsResponse value,
          $Res Function(_$_StartupDeveloperApplicationsResponse) then) =
      __$$_StartupDeveloperApplicationsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime developerApplicationDeadline,
      Iterable<StartupDeveloperApplicationResponse> applications});
}

/// @nodoc
class __$$_StartupDeveloperApplicationsResponseCopyWithImpl<$Res>
    extends _$StartupDeveloperApplicationsResponseCopyWithImpl<$Res,
        _$_StartupDeveloperApplicationsResponse>
    implements _$$_StartupDeveloperApplicationsResponseCopyWith<$Res> {
  __$$_StartupDeveloperApplicationsResponseCopyWithImpl(
      _$_StartupDeveloperApplicationsResponse _value,
      $Res Function(_$_StartupDeveloperApplicationsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developerApplicationDeadline = null,
    Object? applications = null,
  }) {
    return _then(_$_StartupDeveloperApplicationsResponse(
      developerApplicationDeadline: null == developerApplicationDeadline
          ? _value.developerApplicationDeadline
          : developerApplicationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applications: null == applications
          ? _value.applications
          : applications // ignore: cast_nullable_to_non_nullable
              as Iterable<StartupDeveloperApplicationResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupDeveloperApplicationsResponse
    implements _StartupDeveloperApplicationsResponse {
  _$_StartupDeveloperApplicationsResponse(
      {required this.developerApplicationDeadline, required this.applications});

  factory _$_StartupDeveloperApplicationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_StartupDeveloperApplicationsResponseFromJson(json);

  @override
  final DateTime developerApplicationDeadline;
  @override
  final Iterable<StartupDeveloperApplicationResponse> applications;

  @override
  String toString() {
    return 'StartupDeveloperApplicationsResponse(developerApplicationDeadline: $developerApplicationDeadline, applications: $applications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupDeveloperApplicationsResponse &&
            (identical(other.developerApplicationDeadline,
                    developerApplicationDeadline) ||
                other.developerApplicationDeadline ==
                    developerApplicationDeadline) &&
            const DeepCollectionEquality()
                .equals(other.applications, applications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, developerApplicationDeadline,
      const DeepCollectionEquality().hash(applications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupDeveloperApplicationsResponseCopyWith<
          _$_StartupDeveloperApplicationsResponse>
      get copyWith => __$$_StartupDeveloperApplicationsResponseCopyWithImpl<
          _$_StartupDeveloperApplicationsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupDeveloperApplicationsResponseToJson(
      this,
    );
  }
}

abstract class _StartupDeveloperApplicationsResponse
    implements StartupDeveloperApplicationsResponse {
  factory _StartupDeveloperApplicationsResponse(
      {required final DateTime developerApplicationDeadline,
      required final Iterable<StartupDeveloperApplicationResponse>
          applications}) = _$_StartupDeveloperApplicationsResponse;

  factory _StartupDeveloperApplicationsResponse.fromJson(
          Map<String, dynamic> json) =
      _$_StartupDeveloperApplicationsResponse.fromJson;

  @override
  DateTime get developerApplicationDeadline;
  @override
  Iterable<StartupDeveloperApplicationResponse> get applications;
  @override
  @JsonKey(ignore: true)
  _$$_StartupDeveloperApplicationsResponseCopyWith<
          _$_StartupDeveloperApplicationsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
