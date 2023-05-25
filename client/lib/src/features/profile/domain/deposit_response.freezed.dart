// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DepositResponse _$DepositResponseFromJson(Map<String, dynamic> json) {
  return _DepositResponse.fromJson(json);
}

/// @nodoc
mixin _$DepositResponse {
  int get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DepositResponseCopyWith<DepositResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositResponseCopyWith<$Res> {
  factory $DepositResponseCopyWith(
          DepositResponse value, $Res Function(DepositResponse) then) =
      _$DepositResponseCopyWithImpl<$Res, DepositResponse>;
  @useResult
  $Res call({int balance});
}

/// @nodoc
class _$DepositResponseCopyWithImpl<$Res, $Val extends DepositResponse>
    implements $DepositResponseCopyWith<$Res> {
  _$DepositResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DepositResponseCopyWith<$Res>
    implements $DepositResponseCopyWith<$Res> {
  factory _$$_DepositResponseCopyWith(
          _$_DepositResponse value, $Res Function(_$_DepositResponse) then) =
      __$$_DepositResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int balance});
}

/// @nodoc
class __$$_DepositResponseCopyWithImpl<$Res>
    extends _$DepositResponseCopyWithImpl<$Res, _$_DepositResponse>
    implements _$$_DepositResponseCopyWith<$Res> {
  __$$_DepositResponseCopyWithImpl(
      _$_DepositResponse _value, $Res Function(_$_DepositResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_$_DepositResponse(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DepositResponse implements _DepositResponse {
  const _$_DepositResponse({required this.balance});

  factory _$_DepositResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DepositResponseFromJson(json);

  @override
  final int balance;

  @override
  String toString() {
    return 'DepositResponse(balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DepositResponse &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DepositResponseCopyWith<_$_DepositResponse> get copyWith =>
      __$$_DepositResponseCopyWithImpl<_$_DepositResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DepositResponseToJson(
      this,
    );
  }
}

abstract class _DepositResponse implements DepositResponse {
  const factory _DepositResponse({required final int balance}) =
      _$_DepositResponse;

  factory _DepositResponse.fromJson(Map<String, dynamic> json) =
      _$_DepositResponse.fromJson;

  @override
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$_DepositResponseCopyWith<_$_DepositResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
