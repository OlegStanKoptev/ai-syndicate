// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_application_confirm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeveloperApplicationConfirmModel _$DeveloperApplicationConfirmModelFromJson(
    Map<String, dynamic> json) {
  return _DeveloperApplicationConfirmModel.fromJson(json);
}

/// @nodoc
mixin _$DeveloperApplicationConfirmModel {
  DateTime get developerVotingDeadline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeveloperApplicationConfirmModelCopyWith<DeveloperApplicationConfirmModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperApplicationConfirmModelCopyWith<$Res> {
  factory $DeveloperApplicationConfirmModelCopyWith(
          DeveloperApplicationConfirmModel value,
          $Res Function(DeveloperApplicationConfirmModel) then) =
      _$DeveloperApplicationConfirmModelCopyWithImpl<$Res,
          DeveloperApplicationConfirmModel>;
  @useResult
  $Res call({DateTime developerVotingDeadline});
}

/// @nodoc
class _$DeveloperApplicationConfirmModelCopyWithImpl<$Res,
        $Val extends DeveloperApplicationConfirmModel>
    implements $DeveloperApplicationConfirmModelCopyWith<$Res> {
  _$DeveloperApplicationConfirmModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developerVotingDeadline = null,
  }) {
    return _then(_value.copyWith(
      developerVotingDeadline: null == developerVotingDeadline
          ? _value.developerVotingDeadline
          : developerVotingDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeveloperApplicationConfirmModelCopyWith<$Res>
    implements $DeveloperApplicationConfirmModelCopyWith<$Res> {
  factory _$$_DeveloperApplicationConfirmModelCopyWith(
          _$_DeveloperApplicationConfirmModel value,
          $Res Function(_$_DeveloperApplicationConfirmModel) then) =
      __$$_DeveloperApplicationConfirmModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime developerVotingDeadline});
}

/// @nodoc
class __$$_DeveloperApplicationConfirmModelCopyWithImpl<$Res>
    extends _$DeveloperApplicationConfirmModelCopyWithImpl<$Res,
        _$_DeveloperApplicationConfirmModel>
    implements _$$_DeveloperApplicationConfirmModelCopyWith<$Res> {
  __$$_DeveloperApplicationConfirmModelCopyWithImpl(
      _$_DeveloperApplicationConfirmModel _value,
      $Res Function(_$_DeveloperApplicationConfirmModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? developerVotingDeadline = null,
  }) {
    return _then(_$_DeveloperApplicationConfirmModel(
      developerVotingDeadline: null == developerVotingDeadline
          ? _value.developerVotingDeadline
          : developerVotingDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeveloperApplicationConfirmModel
    implements _DeveloperApplicationConfirmModel {
  _$_DeveloperApplicationConfirmModel({required this.developerVotingDeadline});

  factory _$_DeveloperApplicationConfirmModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_DeveloperApplicationConfirmModelFromJson(json);

  @override
  final DateTime developerVotingDeadline;

  @override
  String toString() {
    return 'DeveloperApplicationConfirmModel(developerVotingDeadline: $developerVotingDeadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeveloperApplicationConfirmModel &&
            (identical(
                    other.developerVotingDeadline, developerVotingDeadline) ||
                other.developerVotingDeadline == developerVotingDeadline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, developerVotingDeadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeveloperApplicationConfirmModelCopyWith<
          _$_DeveloperApplicationConfirmModel>
      get copyWith => __$$_DeveloperApplicationConfirmModelCopyWithImpl<
          _$_DeveloperApplicationConfirmModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeveloperApplicationConfirmModelToJson(
      this,
    );
  }
}

abstract class _DeveloperApplicationConfirmModel
    implements DeveloperApplicationConfirmModel {
  factory _DeveloperApplicationConfirmModel(
          {required final DateTime developerVotingDeadline}) =
      _$_DeveloperApplicationConfirmModel;

  factory _DeveloperApplicationConfirmModel.fromJson(
      Map<String, dynamic> json) = _$_DeveloperApplicationConfirmModel.fromJson;

  @override
  DateTime get developerVotingDeadline;
  @override
  @JsonKey(ignore: true)
  _$$_DeveloperApplicationConfirmModelCopyWith<
          _$_DeveloperApplicationConfirmModel>
      get copyWith => throw _privateConstructorUsedError;
}
