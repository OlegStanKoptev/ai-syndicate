// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_developer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupDeveloperResponse _$StartupDeveloperResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupDeveloperResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupDeveloperResponse {
  String get id => throw _privateConstructorUsedError;
  String get shortOrgName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupDeveloperResponseCopyWith<StartupDeveloperResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupDeveloperResponseCopyWith<$Res> {
  factory $StartupDeveloperResponseCopyWith(StartupDeveloperResponse value,
          $Res Function(StartupDeveloperResponse) then) =
      _$StartupDeveloperResponseCopyWithImpl<$Res, StartupDeveloperResponse>;
  @useResult
  $Res call({String id, String shortOrgName, String email});
}

/// @nodoc
class _$StartupDeveloperResponseCopyWithImpl<$Res,
        $Val extends StartupDeveloperResponse>
    implements $StartupDeveloperResponseCopyWith<$Res> {
  _$StartupDeveloperResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shortOrgName = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shortOrgName: null == shortOrgName
          ? _value.shortOrgName
          : shortOrgName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupDeveloperResponseCopyWith<$Res>
    implements $StartupDeveloperResponseCopyWith<$Res> {
  factory _$$_StartupDeveloperResponseCopyWith(
          _$_StartupDeveloperResponse value,
          $Res Function(_$_StartupDeveloperResponse) then) =
      __$$_StartupDeveloperResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String shortOrgName, String email});
}

/// @nodoc
class __$$_StartupDeveloperResponseCopyWithImpl<$Res>
    extends _$StartupDeveloperResponseCopyWithImpl<$Res,
        _$_StartupDeveloperResponse>
    implements _$$_StartupDeveloperResponseCopyWith<$Res> {
  __$$_StartupDeveloperResponseCopyWithImpl(_$_StartupDeveloperResponse _value,
      $Res Function(_$_StartupDeveloperResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shortOrgName = null,
    Object? email = null,
  }) {
    return _then(_$_StartupDeveloperResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shortOrgName: null == shortOrgName
          ? _value.shortOrgName
          : shortOrgName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupDeveloperResponse implements _StartupDeveloperResponse {
  _$_StartupDeveloperResponse(
      {required this.id, required this.shortOrgName, required this.email});

  factory _$_StartupDeveloperResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StartupDeveloperResponseFromJson(json);

  @override
  final String id;
  @override
  final String shortOrgName;
  @override
  final String email;

  @override
  String toString() {
    return 'StartupDeveloperResponse(id: $id, shortOrgName: $shortOrgName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupDeveloperResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shortOrgName, shortOrgName) ||
                other.shortOrgName == shortOrgName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shortOrgName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupDeveloperResponseCopyWith<_$_StartupDeveloperResponse>
      get copyWith => __$$_StartupDeveloperResponseCopyWithImpl<
          _$_StartupDeveloperResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupDeveloperResponseToJson(
      this,
    );
  }
}

abstract class _StartupDeveloperResponse implements StartupDeveloperResponse {
  factory _StartupDeveloperResponse(
      {required final String id,
      required final String shortOrgName,
      required final String email}) = _$_StartupDeveloperResponse;

  factory _StartupDeveloperResponse.fromJson(Map<String, dynamic> json) =
      _$_StartupDeveloperResponse.fromJson;

  @override
  String get id;
  @override
  String get shortOrgName;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_StartupDeveloperResponseCopyWith<_$_StartupDeveloperResponse>
      get copyWith => throw _privateConstructorUsedError;
}
