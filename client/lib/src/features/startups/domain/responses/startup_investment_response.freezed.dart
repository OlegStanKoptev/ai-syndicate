// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_investment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupInvestmentResponse _$StartupInvestmentResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupInvestmentResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupInvestmentResponse {
  StartupInvestorResponse get investor => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupInvestmentResponseCopyWith<StartupInvestmentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupInvestmentResponseCopyWith<$Res> {
  factory $StartupInvestmentResponseCopyWith(StartupInvestmentResponse value,
          $Res Function(StartupInvestmentResponse) then) =
      _$StartupInvestmentResponseCopyWithImpl<$Res, StartupInvestmentResponse>;
  @useResult
  $Res call({StartupInvestorResponse investor, int amount});

  $StartupInvestorResponseCopyWith<$Res> get investor;
}

/// @nodoc
class _$StartupInvestmentResponseCopyWithImpl<$Res,
        $Val extends StartupInvestmentResponse>
    implements $StartupInvestmentResponseCopyWith<$Res> {
  _$StartupInvestmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investor = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      investor: null == investor
          ? _value.investor
          : investor // ignore: cast_nullable_to_non_nullable
              as StartupInvestorResponse,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupInvestorResponseCopyWith<$Res> get investor {
    return $StartupInvestorResponseCopyWith<$Res>(_value.investor, (value) {
      return _then(_value.copyWith(investor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StartupInvestmentResponseCopyWith<$Res>
    implements $StartupInvestmentResponseCopyWith<$Res> {
  factory _$$_StartupInvestmentResponseCopyWith(
          _$_StartupInvestmentResponse value,
          $Res Function(_$_StartupInvestmentResponse) then) =
      __$$_StartupInvestmentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StartupInvestorResponse investor, int amount});

  @override
  $StartupInvestorResponseCopyWith<$Res> get investor;
}

/// @nodoc
class __$$_StartupInvestmentResponseCopyWithImpl<$Res>
    extends _$StartupInvestmentResponseCopyWithImpl<$Res,
        _$_StartupInvestmentResponse>
    implements _$$_StartupInvestmentResponseCopyWith<$Res> {
  __$$_StartupInvestmentResponseCopyWithImpl(
      _$_StartupInvestmentResponse _value,
      $Res Function(_$_StartupInvestmentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investor = null,
    Object? amount = null,
  }) {
    return _then(_$_StartupInvestmentResponse(
      investor: null == investor
          ? _value.investor
          : investor // ignore: cast_nullable_to_non_nullable
              as StartupInvestorResponse,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupInvestmentResponse implements _StartupInvestmentResponse {
  _$_StartupInvestmentResponse({required this.investor, required this.amount});

  factory _$_StartupInvestmentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StartupInvestmentResponseFromJson(json);

  @override
  final StartupInvestorResponse investor;
  @override
  final int amount;

  @override
  String toString() {
    return 'StartupInvestmentResponse(investor: $investor, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupInvestmentResponse &&
            (identical(other.investor, investor) ||
                other.investor == investor) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, investor, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupInvestmentResponseCopyWith<_$_StartupInvestmentResponse>
      get copyWith => __$$_StartupInvestmentResponseCopyWithImpl<
          _$_StartupInvestmentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupInvestmentResponseToJson(
      this,
    );
  }
}

abstract class _StartupInvestmentResponse implements StartupInvestmentResponse {
  factory _StartupInvestmentResponse(
      {required final StartupInvestorResponse investor,
      required final int amount}) = _$_StartupInvestmentResponse;

  factory _StartupInvestmentResponse.fromJson(Map<String, dynamic> json) =
      _$_StartupInvestmentResponse.fromJson;

  @override
  StartupInvestorResponse get investor;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$_StartupInvestmentResponseCopyWith<_$_StartupInvestmentResponse>
      get copyWith => throw _privateConstructorUsedError;
}
