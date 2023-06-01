// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_developer_application_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupDeveloperApplicationResponse
    _$StartupDeveloperApplicationResponseFromJson(Map<String, dynamic> json) {
  return _StartupDeveloperApplicationResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupDeveloperApplicationResponse {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  StartupDeveloperResponse get developer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupDeveloperApplicationResponseCopyWith<
          StartupDeveloperApplicationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupDeveloperApplicationResponseCopyWith<$Res> {
  factory $StartupDeveloperApplicationResponseCopyWith(
          StartupDeveloperApplicationResponse value,
          $Res Function(StartupDeveloperApplicationResponse) then) =
      _$StartupDeveloperApplicationResponseCopyWithImpl<$Res,
          StartupDeveloperApplicationResponse>;
  @useResult
  $Res call({String id, String message, StartupDeveloperResponse developer});

  $StartupDeveloperResponseCopyWith<$Res> get developer;
}

/// @nodoc
class _$StartupDeveloperApplicationResponseCopyWithImpl<$Res,
        $Val extends StartupDeveloperApplicationResponse>
    implements $StartupDeveloperApplicationResponseCopyWith<$Res> {
  _$StartupDeveloperApplicationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? developer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as StartupDeveloperResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupDeveloperResponseCopyWith<$Res> get developer {
    return $StartupDeveloperResponseCopyWith<$Res>(_value.developer, (value) {
      return _then(_value.copyWith(developer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StartupDeveloperApplicationResponseCopyWith<$Res>
    implements $StartupDeveloperApplicationResponseCopyWith<$Res> {
  factory _$$_StartupDeveloperApplicationResponseCopyWith(
          _$_StartupDeveloperApplicationResponse value,
          $Res Function(_$_StartupDeveloperApplicationResponse) then) =
      __$$_StartupDeveloperApplicationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String message, StartupDeveloperResponse developer});

  @override
  $StartupDeveloperResponseCopyWith<$Res> get developer;
}

/// @nodoc
class __$$_StartupDeveloperApplicationResponseCopyWithImpl<$Res>
    extends _$StartupDeveloperApplicationResponseCopyWithImpl<$Res,
        _$_StartupDeveloperApplicationResponse>
    implements _$$_StartupDeveloperApplicationResponseCopyWith<$Res> {
  __$$_StartupDeveloperApplicationResponseCopyWithImpl(
      _$_StartupDeveloperApplicationResponse _value,
      $Res Function(_$_StartupDeveloperApplicationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? developer = null,
  }) {
    return _then(_$_StartupDeveloperApplicationResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as StartupDeveloperResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupDeveloperApplicationResponse
    implements _StartupDeveloperApplicationResponse {
  _$_StartupDeveloperApplicationResponse(
      {required this.id, required this.message, required this.developer});

  factory _$_StartupDeveloperApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_StartupDeveloperApplicationResponseFromJson(json);

  @override
  final String id;
  @override
  final String message;
  @override
  final StartupDeveloperResponse developer;

  @override
  String toString() {
    return 'StartupDeveloperApplicationResponse(id: $id, message: $message, developer: $developer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupDeveloperApplicationResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.developer, developer) ||
                other.developer == developer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, developer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupDeveloperApplicationResponseCopyWith<
          _$_StartupDeveloperApplicationResponse>
      get copyWith => __$$_StartupDeveloperApplicationResponseCopyWithImpl<
          _$_StartupDeveloperApplicationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupDeveloperApplicationResponseToJson(
      this,
    );
  }
}

abstract class _StartupDeveloperApplicationResponse
    implements StartupDeveloperApplicationResponse {
  factory _StartupDeveloperApplicationResponse(
          {required final String id,
          required final String message,
          required final StartupDeveloperResponse developer}) =
      _$_StartupDeveloperApplicationResponse;

  factory _StartupDeveloperApplicationResponse.fromJson(
          Map<String, dynamic> json) =
      _$_StartupDeveloperApplicationResponse.fromJson;

  @override
  String get id;
  @override
  String get message;
  @override
  StartupDeveloperResponse get developer;
  @override
  @JsonKey(ignore: true)
  _$$_StartupDeveloperApplicationResponseCopyWith<
          _$_StartupDeveloperApplicationResponse>
      get copyWith => throw _privateConstructorUsedError;
}
