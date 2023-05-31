// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_confirm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerificationConfirmModel _$VerificationConfirmModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationConfirmModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationConfirmModel {
  DateTime get financingDeadline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationConfirmModelCopyWith<VerificationConfirmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationConfirmModelCopyWith<$Res> {
  factory $VerificationConfirmModelCopyWith(VerificationConfirmModel value,
          $Res Function(VerificationConfirmModel) then) =
      _$VerificationConfirmModelCopyWithImpl<$Res, VerificationConfirmModel>;
  @useResult
  $Res call({DateTime financingDeadline});
}

/// @nodoc
class _$VerificationConfirmModelCopyWithImpl<$Res,
        $Val extends VerificationConfirmModel>
    implements $VerificationConfirmModelCopyWith<$Res> {
  _$VerificationConfirmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? financingDeadline = null,
  }) {
    return _then(_value.copyWith(
      financingDeadline: null == financingDeadline
          ? _value.financingDeadline
          : financingDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerificationConfirmModelCopyWith<$Res>
    implements $VerificationConfirmModelCopyWith<$Res> {
  factory _$$_VerificationConfirmModelCopyWith(
          _$_VerificationConfirmModel value,
          $Res Function(_$_VerificationConfirmModel) then) =
      __$$_VerificationConfirmModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime financingDeadline});
}

/// @nodoc
class __$$_VerificationConfirmModelCopyWithImpl<$Res>
    extends _$VerificationConfirmModelCopyWithImpl<$Res,
        _$_VerificationConfirmModel>
    implements _$$_VerificationConfirmModelCopyWith<$Res> {
  __$$_VerificationConfirmModelCopyWithImpl(_$_VerificationConfirmModel _value,
      $Res Function(_$_VerificationConfirmModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? financingDeadline = null,
  }) {
    return _then(_$_VerificationConfirmModel(
      financingDeadline: null == financingDeadline
          ? _value.financingDeadline
          : financingDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VerificationConfirmModel implements _VerificationConfirmModel {
  _$_VerificationConfirmModel({required this.financingDeadline});

  factory _$_VerificationConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$$_VerificationConfirmModelFromJson(json);

  @override
  final DateTime financingDeadline;

  @override
  String toString() {
    return 'VerificationConfirmModel(financingDeadline: $financingDeadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerificationConfirmModel &&
            (identical(other.financingDeadline, financingDeadline) ||
                other.financingDeadline == financingDeadline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, financingDeadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerificationConfirmModelCopyWith<_$_VerificationConfirmModel>
      get copyWith => __$$_VerificationConfirmModelCopyWithImpl<
          _$_VerificationConfirmModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VerificationConfirmModelToJson(
      this,
    );
  }
}

abstract class _VerificationConfirmModel implements VerificationConfirmModel {
  factory _VerificationConfirmModel(
          {required final DateTime financingDeadline}) =
      _$_VerificationConfirmModel;

  factory _VerificationConfirmModel.fromJson(Map<String, dynamic> json) =
      _$_VerificationConfirmModel.fromJson;

  @override
  DateTime get financingDeadline;
  @override
  @JsonKey(ignore: true)
  _$$_VerificationConfirmModelCopyWith<_$_VerificationConfirmModel>
      get copyWith => throw _privateConstructorUsedError;
}
