// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerificationModel _$VerificationModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'yea':
      return Yea.fromJson(json);
    case 'nay':
      return Nay.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'VerificationModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$VerificationModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() yea,
    required TResult Function(String reason) nay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? yea,
    TResult? Function(String reason)? nay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? yea,
    TResult Function(String reason)? nay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Yea value) yea,
    required TResult Function(Nay value) nay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Yea value)? yea,
    TResult? Function(Nay value)? nay,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Yea value)? yea,
    TResult Function(Nay value)? nay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationModelCopyWith<$Res> {
  factory $VerificationModelCopyWith(
          VerificationModel value, $Res Function(VerificationModel) then) =
      _$VerificationModelCopyWithImpl<$Res, VerificationModel>;
}

/// @nodoc
class _$VerificationModelCopyWithImpl<$Res, $Val extends VerificationModel>
    implements $VerificationModelCopyWith<$Res> {
  _$VerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$YeaCopyWith<$Res> {
  factory _$$YeaCopyWith(_$Yea value, $Res Function(_$Yea) then) =
      __$$YeaCopyWithImpl<$Res>;
}

/// @nodoc
class __$$YeaCopyWithImpl<$Res>
    extends _$VerificationModelCopyWithImpl<$Res, _$Yea>
    implements _$$YeaCopyWith<$Res> {
  __$$YeaCopyWithImpl(_$Yea _value, $Res Function(_$Yea) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Yea implements Yea {
  const _$Yea({final String? $type}) : $type = $type ?? 'yea';

  factory _$Yea.fromJson(Map<String, dynamic> json) => _$$YeaFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'VerificationModel.yea()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Yea);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() yea,
    required TResult Function(String reason) nay,
  }) {
    return yea();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? yea,
    TResult? Function(String reason)? nay,
  }) {
    return yea?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? yea,
    TResult Function(String reason)? nay,
    required TResult orElse(),
  }) {
    if (yea != null) {
      return yea();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Yea value) yea,
    required TResult Function(Nay value) nay,
  }) {
    return yea(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Yea value)? yea,
    TResult? Function(Nay value)? nay,
  }) {
    return yea?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Yea value)? yea,
    TResult Function(Nay value)? nay,
    required TResult orElse(),
  }) {
    if (yea != null) {
      return yea(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$YeaToJson(
      this,
    );
  }
}

abstract class Yea implements VerificationModel {
  const factory Yea() = _$Yea;

  factory Yea.fromJson(Map<String, dynamic> json) = _$Yea.fromJson;
}

/// @nodoc
abstract class _$$NayCopyWith<$Res> {
  factory _$$NayCopyWith(_$Nay value, $Res Function(_$Nay) then) =
      __$$NayCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$NayCopyWithImpl<$Res>
    extends _$VerificationModelCopyWithImpl<$Res, _$Nay>
    implements _$$NayCopyWith<$Res> {
  __$$NayCopyWithImpl(_$Nay _value, $Res Function(_$Nay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$Nay(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Nay implements Nay {
  const _$Nay({required this.reason, final String? $type})
      : $type = $type ?? 'nay';

  factory _$Nay.fromJson(Map<String, dynamic> json) => _$$NayFromJson(json);

  @override
  final String reason;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'VerificationModel.nay(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Nay &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NayCopyWith<_$Nay> get copyWith =>
      __$$NayCopyWithImpl<_$Nay>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() yea,
    required TResult Function(String reason) nay,
  }) {
    return nay(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? yea,
    TResult? Function(String reason)? nay,
  }) {
    return nay?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? yea,
    TResult Function(String reason)? nay,
    required TResult orElse(),
  }) {
    if (nay != null) {
      return nay(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Yea value) yea,
    required TResult Function(Nay value) nay,
  }) {
    return nay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Yea value)? yea,
    TResult? Function(Nay value)? nay,
  }) {
    return nay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Yea value)? yea,
    TResult Function(Nay value)? nay,
    required TResult orElse(),
  }) {
    if (nay != null) {
      return nay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NayToJson(
      this,
    );
  }
}

abstract class Nay implements VerificationModel {
  const factory Nay({required final String reason}) = _$Nay;

  factory Nay.fromJson(Map<String, dynamic> json) = _$Nay.fromJson;

  String get reason;
  @JsonKey(ignore: true)
  _$$NayCopyWith<_$Nay> get copyWith => throw _privateConstructorUsedError;
}
