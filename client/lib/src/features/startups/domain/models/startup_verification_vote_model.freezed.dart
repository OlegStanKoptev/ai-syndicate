// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_verification_vote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupVerificationVoteModel _$StartupVerificationVoteModelFromJson(
    Map<String, dynamic> json) {
  return _StartupVerificationVoteModel.fromJson(json);
}

/// @nodoc
mixin _$StartupVerificationVoteModel {
  String get id => throw _privateConstructorUsedError;
  String get nayReason => throw _privateConstructorUsedError;
  Expert get expert => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupVerificationVoteModelCopyWith<StartupVerificationVoteModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupVerificationVoteModelCopyWith<$Res> {
  factory $StartupVerificationVoteModelCopyWith(
          StartupVerificationVoteModel value,
          $Res Function(StartupVerificationVoteModel) then) =
      _$StartupVerificationVoteModelCopyWithImpl<$Res,
          StartupVerificationVoteModel>;
  @useResult
  $Res call({String id, String nayReason, Expert expert});
}

/// @nodoc
class _$StartupVerificationVoteModelCopyWithImpl<$Res,
        $Val extends StartupVerificationVoteModel>
    implements $StartupVerificationVoteModelCopyWith<$Res> {
  _$StartupVerificationVoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nayReason = null,
    Object? expert = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nayReason: null == nayReason
          ? _value.nayReason
          : nayReason // ignore: cast_nullable_to_non_nullable
              as String,
      expert: freezed == expert
          ? _value.expert
          : expert // ignore: cast_nullable_to_non_nullable
              as Expert,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupVerificationVoteModelCopyWith<$Res>
    implements $StartupVerificationVoteModelCopyWith<$Res> {
  factory _$$_StartupVerificationVoteModelCopyWith(
          _$_StartupVerificationVoteModel value,
          $Res Function(_$_StartupVerificationVoteModel) then) =
      __$$_StartupVerificationVoteModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nayReason, Expert expert});
}

/// @nodoc
class __$$_StartupVerificationVoteModelCopyWithImpl<$Res>
    extends _$StartupVerificationVoteModelCopyWithImpl<$Res,
        _$_StartupVerificationVoteModel>
    implements _$$_StartupVerificationVoteModelCopyWith<$Res> {
  __$$_StartupVerificationVoteModelCopyWithImpl(
      _$_StartupVerificationVoteModel _value,
      $Res Function(_$_StartupVerificationVoteModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nayReason = null,
    Object? expert = freezed,
  }) {
    return _then(_$_StartupVerificationVoteModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nayReason: null == nayReason
          ? _value.nayReason
          : nayReason // ignore: cast_nullable_to_non_nullable
              as String,
      expert: freezed == expert
          ? _value.expert
          : expert // ignore: cast_nullable_to_non_nullable
              as Expert,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupVerificationVoteModel implements _StartupVerificationVoteModel {
  _$_StartupVerificationVoteModel(
      {required this.id, required this.nayReason, required this.expert});

  factory _$_StartupVerificationVoteModel.fromJson(Map<String, dynamic> json) =>
      _$$_StartupVerificationVoteModelFromJson(json);

  @override
  final String id;
  @override
  final String nayReason;
  @override
  final Expert expert;

  @override
  String toString() {
    return 'StartupVerificationVoteModel(id: $id, nayReason: $nayReason, expert: $expert)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupVerificationVoteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nayReason, nayReason) ||
                other.nayReason == nayReason) &&
            const DeepCollectionEquality().equals(other.expert, expert));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nayReason, const DeepCollectionEquality().hash(expert));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupVerificationVoteModelCopyWith<_$_StartupVerificationVoteModel>
      get copyWith => __$$_StartupVerificationVoteModelCopyWithImpl<
          _$_StartupVerificationVoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupVerificationVoteModelToJson(
      this,
    );
  }
}

abstract class _StartupVerificationVoteModel
    implements StartupVerificationVoteModel {
  factory _StartupVerificationVoteModel(
      {required final String id,
      required final String nayReason,
      required final Expert expert}) = _$_StartupVerificationVoteModel;

  factory _StartupVerificationVoteModel.fromJson(Map<String, dynamic> json) =
      _$_StartupVerificationVoteModel.fromJson;

  @override
  String get id;
  @override
  String get nayReason;
  @override
  Expert get expert;
  @override
  @JsonKey(ignore: true)
  _$$_StartupVerificationVoteModelCopyWith<_$_StartupVerificationVoteModel>
      get copyWith => throw _privateConstructorUsedError;
}
