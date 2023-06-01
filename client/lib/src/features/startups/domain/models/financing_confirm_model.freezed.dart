// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financing_confirm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FinancingConfirmModel _$FinancingConfirmModelFromJson(
    Map<String, dynamic> json) {
  return _FinancingConfirmModel.fromJson(json);
}

/// @nodoc
mixin _$FinancingConfirmModel {
  DateTime get developerApplicationDeadline =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancingConfirmModelCopyWith<FinancingConfirmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancingConfirmModelCopyWith<$Res> {
  factory $FinancingConfirmModelCopyWith(FinancingConfirmModel value,
          $Res Function(FinancingConfirmModel) then) =
      _$FinancingConfirmModelCopyWithImpl<$Res, FinancingConfirmModel>;
  @useResult
  $Res call({DateTime developerApplicationDeadline});
}

/// @nodoc
class _$FinancingConfirmModelCopyWithImpl<$Res,
        $Val extends FinancingConfirmModel>
    implements $FinancingConfirmModelCopyWith<$Res> {
  _$FinancingConfirmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developerApplicationDeadline = null,
  }) {
    return _then(_value.copyWith(
      developerApplicationDeadline: null == developerApplicationDeadline
          ? _value.developerApplicationDeadline
          : developerApplicationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FinancingConfirmModelCopyWith<$Res>
    implements $FinancingConfirmModelCopyWith<$Res> {
  factory _$$_FinancingConfirmModelCopyWith(_$_FinancingConfirmModel value,
          $Res Function(_$_FinancingConfirmModel) then) =
      __$$_FinancingConfirmModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime developerApplicationDeadline});
}

/// @nodoc
class __$$_FinancingConfirmModelCopyWithImpl<$Res>
    extends _$FinancingConfirmModelCopyWithImpl<$Res, _$_FinancingConfirmModel>
    implements _$$_FinancingConfirmModelCopyWith<$Res> {
  __$$_FinancingConfirmModelCopyWithImpl(_$_FinancingConfirmModel _value,
      $Res Function(_$_FinancingConfirmModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developerApplicationDeadline = null,
  }) {
    return _then(_$_FinancingConfirmModel(
      developerApplicationDeadline: null == developerApplicationDeadline
          ? _value.developerApplicationDeadline
          : developerApplicationDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FinancingConfirmModel implements _FinancingConfirmModel {
  _$_FinancingConfirmModel({required this.developerApplicationDeadline});

  factory _$_FinancingConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$$_FinancingConfirmModelFromJson(json);

  @override
  final DateTime developerApplicationDeadline;

  @override
  String toString() {
    return 'FinancingConfirmModel(developerApplicationDeadline: $developerApplicationDeadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FinancingConfirmModel &&
            (identical(other.developerApplicationDeadline,
                    developerApplicationDeadline) ||
                other.developerApplicationDeadline ==
                    developerApplicationDeadline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, developerApplicationDeadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinancingConfirmModelCopyWith<_$_FinancingConfirmModel> get copyWith =>
      __$$_FinancingConfirmModelCopyWithImpl<_$_FinancingConfirmModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FinancingConfirmModelToJson(
      this,
    );
  }
}

abstract class _FinancingConfirmModel implements FinancingConfirmModel {
  factory _FinancingConfirmModel(
          {required final DateTime developerApplicationDeadline}) =
      _$_FinancingConfirmModel;

  factory _FinancingConfirmModel.fromJson(Map<String, dynamic> json) =
      _$_FinancingConfirmModel.fromJson;

  @override
  DateTime get developerApplicationDeadline;
  @override
  @JsonKey(ignore: true)
  _$$_FinancingConfirmModelCopyWith<_$_FinancingConfirmModel> get copyWith =>
      throw _privateConstructorUsedError;
}
