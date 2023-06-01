// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeveloperApplicationModel _$DeveloperApplicationModelFromJson(
    Map<String, dynamic> json) {
  return _DeveloperApplicationModel.fromJson(json);
}

/// @nodoc
mixin _$DeveloperApplicationModel {
  String get id => throw _privateConstructorUsedError;
  String get startupId => throw _privateConstructorUsedError;
  String get developerId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ShortStartupModel? get startup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeveloperApplicationModelCopyWith<DeveloperApplicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperApplicationModelCopyWith<$Res> {
  factory $DeveloperApplicationModelCopyWith(DeveloperApplicationModel value,
          $Res Function(DeveloperApplicationModel) then) =
      _$DeveloperApplicationModelCopyWithImpl<$Res, DeveloperApplicationModel>;
  @useResult
  $Res call(
      {String id,
      String startupId,
      String developerId,
      String message,
      ShortStartupModel? startup});

  $ShortStartupModelCopyWith<$Res>? get startup;
}

/// @nodoc
class _$DeveloperApplicationModelCopyWithImpl<$Res,
        $Val extends DeveloperApplicationModel>
    implements $DeveloperApplicationModelCopyWith<$Res> {
  _$DeveloperApplicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? developerId = null,
    Object? message = null,
    Object? startup = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      developerId: null == developerId
          ? _value.developerId
          : developerId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      startup: freezed == startup
          ? _value.startup
          : startup // ignore: cast_nullable_to_non_nullable
              as ShortStartupModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortStartupModelCopyWith<$Res>? get startup {
    if (_value.startup == null) {
      return null;
    }

    return $ShortStartupModelCopyWith<$Res>(_value.startup!, (value) {
      return _then(_value.copyWith(startup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeveloperApplicationModelCopyWith<$Res>
    implements $DeveloperApplicationModelCopyWith<$Res> {
  factory _$$_DeveloperApplicationModelCopyWith(
          _$_DeveloperApplicationModel value,
          $Res Function(_$_DeveloperApplicationModel) then) =
      __$$_DeveloperApplicationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String startupId,
      String developerId,
      String message,
      ShortStartupModel? startup});

  @override
  $ShortStartupModelCopyWith<$Res>? get startup;
}

/// @nodoc
class __$$_DeveloperApplicationModelCopyWithImpl<$Res>
    extends _$DeveloperApplicationModelCopyWithImpl<$Res,
        _$_DeveloperApplicationModel>
    implements _$$_DeveloperApplicationModelCopyWith<$Res> {
  __$$_DeveloperApplicationModelCopyWithImpl(
      _$_DeveloperApplicationModel _value,
      $Res Function(_$_DeveloperApplicationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? developerId = null,
    Object? message = null,
    Object? startup = freezed,
  }) {
    return _then(_$_DeveloperApplicationModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startupId: null == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String,
      developerId: null == developerId
          ? _value.developerId
          : developerId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      startup: freezed == startup
          ? _value.startup
          : startup // ignore: cast_nullable_to_non_nullable
              as ShortStartupModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeveloperApplicationModel implements _DeveloperApplicationModel {
  _$_DeveloperApplicationModel(
      {required this.id,
      required this.startupId,
      required this.developerId,
      required this.message,
      this.startup});

  factory _$_DeveloperApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeveloperApplicationModelFromJson(json);

  @override
  final String id;
  @override
  final String startupId;
  @override
  final String developerId;
  @override
  final String message;
  @override
  final ShortStartupModel? startup;

  @override
  String toString() {
    return 'DeveloperApplicationModel(id: $id, startupId: $startupId, developerId: $developerId, message: $message, startup: $startup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeveloperApplicationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.developerId, developerId) ||
                other.developerId == developerId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.startup, startup) || other.startup == startup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startupId, developerId, message, startup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeveloperApplicationModelCopyWith<_$_DeveloperApplicationModel>
      get copyWith => __$$_DeveloperApplicationModelCopyWithImpl<
          _$_DeveloperApplicationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeveloperApplicationModelToJson(
      this,
    );
  }
}

abstract class _DeveloperApplicationModel implements DeveloperApplicationModel {
  factory _DeveloperApplicationModel(
      {required final String id,
      required final String startupId,
      required final String developerId,
      required final String message,
      final ShortStartupModel? startup}) = _$_DeveloperApplicationModel;

  factory _DeveloperApplicationModel.fromJson(Map<String, dynamic> json) =
      _$_DeveloperApplicationModel.fromJson;

  @override
  String get id;
  @override
  String get startupId;
  @override
  String get developerId;
  @override
  String get message;
  @override
  ShortStartupModel? get startup;
  @override
  @JsonKey(ignore: true)
  _$$_DeveloperApplicationModelCopyWith<_$_DeveloperApplicationModel>
      get copyWith => throw _privateConstructorUsedError;
}
