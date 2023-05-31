// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investments_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvestmentsResponse _$InvestmentsResponseFromJson(Map<String, dynamic> json) {
  return _InvestmentsResponse.fromJson(json);
}

/// @nodoc
mixin _$InvestmentsResponse {
  List<Investment> get investments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvestmentsResponseCopyWith<InvestmentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentsResponseCopyWith<$Res> {
  factory $InvestmentsResponseCopyWith(
          InvestmentsResponse value, $Res Function(InvestmentsResponse) then) =
      _$InvestmentsResponseCopyWithImpl<$Res, InvestmentsResponse>;
  @useResult
  $Res call({List<Investment> investments});
}

/// @nodoc
class _$InvestmentsResponseCopyWithImpl<$Res, $Val extends InvestmentsResponse>
    implements $InvestmentsResponseCopyWith<$Res> {
  _$InvestmentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investments = null,
  }) {
    return _then(_value.copyWith(
      investments: null == investments
          ? _value.investments
          : investments // ignore: cast_nullable_to_non_nullable
              as List<Investment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvestmentsResponseCopyWith<$Res>
    implements $InvestmentsResponseCopyWith<$Res> {
  factory _$$_InvestmentsResponseCopyWith(_$_InvestmentsResponse value,
          $Res Function(_$_InvestmentsResponse) then) =
      __$$_InvestmentsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Investment> investments});
}

/// @nodoc
class __$$_InvestmentsResponseCopyWithImpl<$Res>
    extends _$InvestmentsResponseCopyWithImpl<$Res, _$_InvestmentsResponse>
    implements _$$_InvestmentsResponseCopyWith<$Res> {
  __$$_InvestmentsResponseCopyWithImpl(_$_InvestmentsResponse _value,
      $Res Function(_$_InvestmentsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? investments = null,
  }) {
    return _then(_$_InvestmentsResponse(
      investments: null == investments
          ? _value._investments
          : investments // ignore: cast_nullable_to_non_nullable
              as List<Investment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvestmentsResponse implements _InvestmentsResponse {
  const _$_InvestmentsResponse({required final List<Investment> investments})
      : _investments = investments;

  factory _$_InvestmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_InvestmentsResponseFromJson(json);

  final List<Investment> _investments;
  @override
  List<Investment> get investments {
    if (_investments is EqualUnmodifiableListView) return _investments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_investments);
  }

  @override
  String toString() {
    return 'InvestmentsResponse(investments: $investments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvestmentsResponse &&
            const DeepCollectionEquality()
                .equals(other._investments, _investments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_investments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvestmentsResponseCopyWith<_$_InvestmentsResponse> get copyWith =>
      __$$_InvestmentsResponseCopyWithImpl<_$_InvestmentsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvestmentsResponseToJson(
      this,
    );
  }
}

abstract class _InvestmentsResponse implements InvestmentsResponse {
  const factory _InvestmentsResponse(
      {required final List<Investment> investments}) = _$_InvestmentsResponse;

  factory _InvestmentsResponse.fromJson(Map<String, dynamic> json) =
      _$_InvestmentsResponse.fromJson;

  @override
  List<Investment> get investments;
  @override
  @JsonKey(ignore: true)
  _$$_InvestmentsResponseCopyWith<_$_InvestmentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
