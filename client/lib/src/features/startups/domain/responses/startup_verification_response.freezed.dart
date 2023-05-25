// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_verification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupVerificationResponse _$StartupVerificationResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupVerificationResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupVerificationResponse {
  int get yeasTotal => throw _privateConstructorUsedError;
  int get naysTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupVerificationResponseCopyWith<StartupVerificationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupVerificationResponseCopyWith<$Res> {
  factory $StartupVerificationResponseCopyWith(
          StartupVerificationResponse value,
          $Res Function(StartupVerificationResponse) then) =
      _$StartupVerificationResponseCopyWithImpl<$Res,
          StartupVerificationResponse>;
  @useResult
  $Res call({int yeasTotal, int naysTotal});
}

/// @nodoc
class _$StartupVerificationResponseCopyWithImpl<$Res,
        $Val extends StartupVerificationResponse>
    implements $StartupVerificationResponseCopyWith<$Res> {
  _$StartupVerificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yeasTotal = null,
    Object? naysTotal = null,
  }) {
    return _then(_value.copyWith(
      yeasTotal: null == yeasTotal
          ? _value.yeasTotal
          : yeasTotal // ignore: cast_nullable_to_non_nullable
              as int,
      naysTotal: null == naysTotal
          ? _value.naysTotal
          : naysTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupVerificationResponseCopyWith<$Res>
    implements $StartupVerificationResponseCopyWith<$Res> {
  factory _$$_StartupVerificationResponseCopyWith(
          _$_StartupVerificationResponse value,
          $Res Function(_$_StartupVerificationResponse) then) =
      __$$_StartupVerificationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int yeasTotal, int naysTotal});
}

/// @nodoc
class __$$_StartupVerificationResponseCopyWithImpl<$Res>
    extends _$StartupVerificationResponseCopyWithImpl<$Res,
        _$_StartupVerificationResponse>
    implements _$$_StartupVerificationResponseCopyWith<$Res> {
  __$$_StartupVerificationResponseCopyWithImpl(
      _$_StartupVerificationResponse _value,
      $Res Function(_$_StartupVerificationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yeasTotal = null,
    Object? naysTotal = null,
  }) {
    return _then(_$_StartupVerificationResponse(
      yeasTotal: null == yeasTotal
          ? _value.yeasTotal
          : yeasTotal // ignore: cast_nullable_to_non_nullable
              as int,
      naysTotal: null == naysTotal
          ? _value.naysTotal
          : naysTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupVerificationResponse implements _StartupVerificationResponse {
  _$_StartupVerificationResponse(
      {required this.yeasTotal, required this.naysTotal});

  factory _$_StartupVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StartupVerificationResponseFromJson(json);

  @override
  final int yeasTotal;
  @override
  final int naysTotal;

  @override
  String toString() {
    return 'StartupVerificationResponse(yeasTotal: $yeasTotal, naysTotal: $naysTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupVerificationResponse &&
            (identical(other.yeasTotal, yeasTotal) ||
                other.yeasTotal == yeasTotal) &&
            (identical(other.naysTotal, naysTotal) ||
                other.naysTotal == naysTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, yeasTotal, naysTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupVerificationResponseCopyWith<_$_StartupVerificationResponse>
      get copyWith => __$$_StartupVerificationResponseCopyWithImpl<
          _$_StartupVerificationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupVerificationResponseToJson(
      this,
    );
  }
}

abstract class _StartupVerificationResponse
    implements StartupVerificationResponse {
  factory _StartupVerificationResponse(
      {required final int yeasTotal,
      required final int naysTotal}) = _$_StartupVerificationResponse;

  factory _StartupVerificationResponse.fromJson(Map<String, dynamic> json) =
      _$_StartupVerificationResponse.fromJson;

  @override
  int get yeasTotal;
  @override
  int get naysTotal;
  @override
  @JsonKey(ignore: true)
  _$$_StartupVerificationResponseCopyWith<_$_StartupVerificationResponse>
      get copyWith => throw _privateConstructorUsedError;
}
