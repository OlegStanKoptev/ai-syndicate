// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_investor_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupInvestorResponse _$StartupInvestorResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupInvestorResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupInvestorResponse {
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupInvestorResponseCopyWith<StartupInvestorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupInvestorResponseCopyWith<$Res> {
  factory $StartupInvestorResponseCopyWith(StartupInvestorResponse value,
          $Res Function(StartupInvestorResponse) then) =
      _$StartupInvestorResponseCopyWithImpl<$Res, StartupInvestorResponse>;
  @useResult
  $Res call({String id, String fullName});
}

/// @nodoc
class _$StartupInvestorResponseCopyWithImpl<$Res,
        $Val extends StartupInvestorResponse>
    implements $StartupInvestorResponseCopyWith<$Res> {
  _$StartupInvestorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupInvestorResponseCopyWith<$Res>
    implements $StartupInvestorResponseCopyWith<$Res> {
  factory _$$_StartupInvestorResponseCopyWith(_$_StartupInvestorResponse value,
          $Res Function(_$_StartupInvestorResponse) then) =
      __$$_StartupInvestorResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String fullName});
}

/// @nodoc
class __$$_StartupInvestorResponseCopyWithImpl<$Res>
    extends _$StartupInvestorResponseCopyWithImpl<$Res,
        _$_StartupInvestorResponse>
    implements _$$_StartupInvestorResponseCopyWith<$Res> {
  __$$_StartupInvestorResponseCopyWithImpl(_$_StartupInvestorResponse _value,
      $Res Function(_$_StartupInvestorResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
  }) {
    return _then(_$_StartupInvestorResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupInvestorResponse implements _StartupInvestorResponse {
  _$_StartupInvestorResponse({required this.id, required this.fullName});

  factory _$_StartupInvestorResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StartupInvestorResponseFromJson(json);

  @override
  final String id;
  @override
  final String fullName;

  @override
  String toString() {
    return 'StartupInvestorResponse(id: $id, fullName: $fullName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupInvestorResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupInvestorResponseCopyWith<_$_StartupInvestorResponse>
      get copyWith =>
          __$$_StartupInvestorResponseCopyWithImpl<_$_StartupInvestorResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupInvestorResponseToJson(
      this,
    );
  }
}

abstract class _StartupInvestorResponse implements StartupInvestorResponse {
  factory _StartupInvestorResponse(
      {required final String id,
      required final String fullName}) = _$_StartupInvestorResponse;

  factory _StartupInvestorResponse.fromJson(Map<String, dynamic> json) =
      _$_StartupInvestorResponse.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$_StartupInvestorResponseCopyWith<_$_StartupInvestorResponse>
      get copyWith => throw _privateConstructorUsedError;
}
