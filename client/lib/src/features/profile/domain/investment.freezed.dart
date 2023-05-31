// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Investment _$InvestmentFromJson(Map<String, dynamic> json) {
  return _Investment.fromJson(json);
}

/// @nodoc
mixin _$Investment {
  String get startupId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentCopyWith<Investment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentCopyWith<$Res> {
  factory $InvestmentCopyWith(
          Investment value, $Res Function(Investment) then) =
      _$InvestmentCopyWithImpl<$Res, Investment>;
  @useResult
  $Res call({String startupId, int amount, DateTime date});
}

/// @nodoc
class _$InvestmentCopyWithImpl<$Res, $Val extends Investment>
    implements $InvestmentCopyWith<$Res> {
  _$InvestmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startupId = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvestmentCopyWith<$Res>
    implements $InvestmentCopyWith<$Res> {
  factory _$$_InvestmentCopyWith(
          _$_Investment value, $Res Function(_$_Investment) then) =
      __$$_InvestmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String startupId, int amount, DateTime date});
}

/// @nodoc
class __$$_InvestmentCopyWithImpl<$Res>
    extends _$InvestmentCopyWithImpl<$Res, _$_Investment>
    implements _$$_InvestmentCopyWith<$Res> {
  __$$_InvestmentCopyWithImpl(
      _$_Investment _value, $Res Function(_$_Investment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startupId = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$_Investment(
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Investment implements _Investment {
  const _$_Investment(
      {required this.startupId, required this.amount, required this.date});

  factory _$_Investment.fromJson(Map<String, dynamic> json) =>
      _$$_InvestmentFromJson(json);

  @override
  final String startupId;
  @override
  final int amount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Investment(startupId: $startupId, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Investment &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startupId, amount, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvestmentCopyWith<_$_Investment> get copyWith =>
      __$$_InvestmentCopyWithImpl<_$_Investment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvestmentToJson(
      this,
    );
  }
}

abstract class _Investment implements Investment {
  const factory _Investment(
      {required final String startupId,
      required final int amount,
      required final DateTime date}) = _$_Investment;

  factory _Investment.fromJson(Map<String, dynamic> json) =
      _$_Investment.fromJson;

  @override
  String get startupId;
  @override
  int get amount;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_InvestmentCopyWith<_$_Investment> get copyWith =>
      throw _privateConstructorUsedError;
}
