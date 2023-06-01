// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_voting_confirm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeveloperVotingConfirmModel _$DeveloperVotingConfirmModelFromJson(
    Map<String, dynamic> json) {
  return _DeveloperVotingConfirmModel.fromJson(json);
}

/// @nodoc
mixin _$DeveloperVotingConfirmModel {
  DateTime get developmentDeadline => throw _privateConstructorUsedError;
  String get applicationDeveloperId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeveloperVotingConfirmModelCopyWith<DeveloperVotingConfirmModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperVotingConfirmModelCopyWith<$Res> {
  factory $DeveloperVotingConfirmModelCopyWith(
          DeveloperVotingConfirmModel value,
          $Res Function(DeveloperVotingConfirmModel) then) =
      _$DeveloperVotingConfirmModelCopyWithImpl<$Res,
          DeveloperVotingConfirmModel>;
  @useResult
  $Res call({DateTime developmentDeadline, String applicationDeveloperId});
}

/// @nodoc
class _$DeveloperVotingConfirmModelCopyWithImpl<$Res,
        $Val extends DeveloperVotingConfirmModel>
    implements $DeveloperVotingConfirmModelCopyWith<$Res> {
  _$DeveloperVotingConfirmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developmentDeadline = null,
    Object? applicationDeveloperId = null,
  }) {
    return _then(_value.copyWith(
      developmentDeadline: null == developmentDeadline
          ? _value.developmentDeadline
          : developmentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicationDeveloperId: null == applicationDeveloperId
          ? _value.applicationDeveloperId
          : applicationDeveloperId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeveloperVotingConfirmModelCopyWith<$Res>
    implements $DeveloperVotingConfirmModelCopyWith<$Res> {
  factory _$$_DeveloperVotingConfirmModelCopyWith(
          _$_DeveloperVotingConfirmModel value,
          $Res Function(_$_DeveloperVotingConfirmModel) then) =
      __$$_DeveloperVotingConfirmModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime developmentDeadline, String applicationDeveloperId});
}

/// @nodoc
class __$$_DeveloperVotingConfirmModelCopyWithImpl<$Res>
    extends _$DeveloperVotingConfirmModelCopyWithImpl<$Res,
        _$_DeveloperVotingConfirmModel>
    implements _$$_DeveloperVotingConfirmModelCopyWith<$Res> {
  __$$_DeveloperVotingConfirmModelCopyWithImpl(
      _$_DeveloperVotingConfirmModel _value,
      $Res Function(_$_DeveloperVotingConfirmModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developmentDeadline = null,
    Object? applicationDeveloperId = null,
  }) {
    return _then(_$_DeveloperVotingConfirmModel(
      developmentDeadline: null == developmentDeadline
          ? _value.developmentDeadline
          : developmentDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      applicationDeveloperId: null == applicationDeveloperId
          ? _value.applicationDeveloperId
          : applicationDeveloperId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeveloperVotingConfirmModel implements _DeveloperVotingConfirmModel {
  _$_DeveloperVotingConfirmModel(
      {required this.developmentDeadline,
      required this.applicationDeveloperId});

  factory _$_DeveloperVotingConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeveloperVotingConfirmModelFromJson(json);

  @override
  final DateTime developmentDeadline;
  @override
  final String applicationDeveloperId;

  @override
  String toString() {
    return 'DeveloperVotingConfirmModel(developmentDeadline: $developmentDeadline, applicationDeveloperId: $applicationDeveloperId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeveloperVotingConfirmModel &&
            (identical(other.developmentDeadline, developmentDeadline) ||
                other.developmentDeadline == developmentDeadline) &&
            (identical(other.applicationDeveloperId, applicationDeveloperId) ||
                other.applicationDeveloperId == applicationDeveloperId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, developmentDeadline, applicationDeveloperId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeveloperVotingConfirmModelCopyWith<_$_DeveloperVotingConfirmModel>
      get copyWith => __$$_DeveloperVotingConfirmModelCopyWithImpl<
          _$_DeveloperVotingConfirmModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeveloperVotingConfirmModelToJson(
      this,
    );
  }
}

abstract class _DeveloperVotingConfirmModel
    implements DeveloperVotingConfirmModel {
  factory _DeveloperVotingConfirmModel(
          {required final DateTime developmentDeadline,
          required final String applicationDeveloperId}) =
      _$_DeveloperVotingConfirmModel;

  factory _DeveloperVotingConfirmModel.fromJson(Map<String, dynamic> json) =
      _$_DeveloperVotingConfirmModel.fromJson;

  @override
  DateTime get developmentDeadline;
  @override
  String get applicationDeveloperId;
  @override
  @JsonKey(ignore: true)
  _$$_DeveloperVotingConfirmModelCopyWith<_$_DeveloperVotingConfirmModel>
      get copyWith => throw _privateConstructorUsedError;
}
