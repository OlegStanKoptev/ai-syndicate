// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_financing_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupFinancingResponse _$StartupFinancingResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupFinancingResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupFinancingResponse {
  DateTime get financingDeadline => throw _privateConstructorUsedError;
  int get investmentsTotal => throw _privateConstructorUsedError;
  Iterable<StartupInvestmentResponse> get investments =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupFinancingResponseCopyWith<StartupFinancingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupFinancingResponseCopyWith<$Res> {
  factory $StartupFinancingResponseCopyWith(StartupFinancingResponse value,
          $Res Function(StartupFinancingResponse) then) =
      _$StartupFinancingResponseCopyWithImpl<$Res, StartupFinancingResponse>;
  @useResult
  $Res call(
      {DateTime financingDeadline,
      int investmentsTotal,
      Iterable<StartupInvestmentResponse> investments});
}

/// @nodoc
class _$StartupFinancingResponseCopyWithImpl<$Res,
        $Val extends StartupFinancingResponse>
    implements $StartupFinancingResponseCopyWith<$Res> {
  _$StartupFinancingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? financingDeadline = null,
    Object? investmentsTotal = null,
    Object? investments = null,
  }) {
    return _then(_value.copyWith(
      financingDeadline: null == financingDeadline
          ? _value.financingDeadline
          : financingDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      investmentsTotal: null == investmentsTotal
          ? _value.investmentsTotal
          : investmentsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      investments: null == investments
          ? _value.investments
          : investments // ignore: cast_nullable_to_non_nullable
              as Iterable<StartupInvestmentResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupFinancingResponseCopyWith<$Res>
    implements $StartupFinancingResponseCopyWith<$Res> {
  factory _$$_StartupFinancingResponseCopyWith(
          _$_StartupFinancingResponse value,
          $Res Function(_$_StartupFinancingResponse) then) =
      __$$_StartupFinancingResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime financingDeadline,
      int investmentsTotal,
      Iterable<StartupInvestmentResponse> investments});
}

/// @nodoc
class __$$_StartupFinancingResponseCopyWithImpl<$Res>
    extends _$StartupFinancingResponseCopyWithImpl<$Res,
        _$_StartupFinancingResponse>
    implements _$$_StartupFinancingResponseCopyWith<$Res> {
  __$$_StartupFinancingResponseCopyWithImpl(_$_StartupFinancingResponse _value,
      $Res Function(_$_StartupFinancingResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? financingDeadline = null,
    Object? investmentsTotal = null,
    Object? investments = null,
  }) {
    return _then(_$_StartupFinancingResponse(
      financingDeadline: null == financingDeadline
          ? _value.financingDeadline
          : financingDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      investmentsTotal: null == investmentsTotal
          ? _value.investmentsTotal
          : investmentsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      investments: null == investments
          ? _value.investments
          : investments // ignore: cast_nullable_to_non_nullable
              as Iterable<StartupInvestmentResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupFinancingResponse implements _StartupFinancingResponse {
  _$_StartupFinancingResponse(
      {required this.financingDeadline,
      required this.investmentsTotal,
      required this.investments});

  factory _$_StartupFinancingResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StartupFinancingResponseFromJson(json);

  @override
  final DateTime financingDeadline;
  @override
  final int investmentsTotal;
  @override
  final Iterable<StartupInvestmentResponse> investments;

  @override
  String toString() {
    return 'StartupFinancingResponse(financingDeadline: $financingDeadline, investmentsTotal: $investmentsTotal, investments: $investments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupFinancingResponse &&
            (identical(other.financingDeadline, financingDeadline) ||
                other.financingDeadline == financingDeadline) &&
            (identical(other.investmentsTotal, investmentsTotal) ||
                other.investmentsTotal == investmentsTotal) &&
            const DeepCollectionEquality()
                .equals(other.investments, investments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, financingDeadline,
      investmentsTotal, const DeepCollectionEquality().hash(investments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupFinancingResponseCopyWith<_$_StartupFinancingResponse>
      get copyWith => __$$_StartupFinancingResponseCopyWithImpl<
          _$_StartupFinancingResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupFinancingResponseToJson(
      this,
    );
  }
}

abstract class _StartupFinancingResponse implements StartupFinancingResponse {
  factory _StartupFinancingResponse(
          {required final DateTime financingDeadline,
          required final int investmentsTotal,
          required final Iterable<StartupInvestmentResponse> investments}) =
      _$_StartupFinancingResponse;

  factory _StartupFinancingResponse.fromJson(Map<String, dynamic> json) =
      _$_StartupFinancingResponse.fromJson;

  @override
  DateTime get financingDeadline;
  @override
  int get investmentsTotal;
  @override
  Iterable<StartupInvestmentResponse> get investments;
  @override
  @JsonKey(ignore: true)
  _$$_StartupFinancingResponseCopyWith<_$_StartupFinancingResponse>
      get copyWith => throw _privateConstructorUsedError;
}
