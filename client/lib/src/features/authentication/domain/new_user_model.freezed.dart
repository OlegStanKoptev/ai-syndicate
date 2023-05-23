// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewUserModel _$NewUserModelFromJson(Map<String, dynamic> json) {
  return _NewUserModel.fromJson(json);
}

/// @nodoc
mixin _$NewUserModel {
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get avatarImageFile => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewUserModelCopyWith<NewUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewUserModelCopyWith<$Res> {
  factory $NewUserModelCopyWith(
          NewUserModel value, $Res Function(NewUserModel) then) =
      _$NewUserModelCopyWithImpl<$Res, NewUserModel>;
  @useResult
  $Res call(
      {String email,
      String fullName,
      String? avatarImageFile,
      String password});
}

/// @nodoc
class _$NewUserModelCopyWithImpl<$Res, $Val extends NewUserModel>
    implements $NewUserModelCopyWith<$Res> {
  _$NewUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? avatarImageFile = freezed,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarImageFile: freezed == avatarImageFile
          ? _value.avatarImageFile
          : avatarImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewUserModelCopyWith<$Res>
    implements $NewUserModelCopyWith<$Res> {
  factory _$$_NewUserModelCopyWith(
          _$_NewUserModel value, $Res Function(_$_NewUserModel) then) =
      __$$_NewUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String fullName,
      String? avatarImageFile,
      String password});
}

/// @nodoc
class __$$_NewUserModelCopyWithImpl<$Res>
    extends _$NewUserModelCopyWithImpl<$Res, _$_NewUserModel>
    implements _$$_NewUserModelCopyWith<$Res> {
  __$$_NewUserModelCopyWithImpl(
      _$_NewUserModel _value, $Res Function(_$_NewUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? avatarImageFile = freezed,
    Object? password = null,
  }) {
    return _then(_$_NewUserModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarImageFile: freezed == avatarImageFile
          ? _value.avatarImageFile
          : avatarImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewUserModel implements _NewUserModel {
  const _$_NewUserModel(
      {required this.email,
      required this.fullName,
      required this.avatarImageFile,
      required this.password});

  factory _$_NewUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewUserModelFromJson(json);

  @override
  final String email;
  @override
  final String fullName;
  @override
  final String? avatarImageFile;
  @override
  final String password;

  @override
  String toString() {
    return 'NewUserModel(email: $email, fullName: $fullName, avatarImageFile: $avatarImageFile, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewUserModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarImageFile, avatarImageFile) ||
                other.avatarImageFile == avatarImageFile) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, fullName, avatarImageFile, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewUserModelCopyWith<_$_NewUserModel> get copyWith =>
      __$$_NewUserModelCopyWithImpl<_$_NewUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewUserModelToJson(
      this,
    );
  }
}

abstract class _NewUserModel implements NewUserModel {
  const factory _NewUserModel(
      {required final String email,
      required final String fullName,
      required final String? avatarImageFile,
      required final String password}) = _$_NewUserModel;

  factory _NewUserModel.fromJson(Map<String, dynamic> json) =
      _$_NewUserModel.fromJson;

  @override
  String get email;
  @override
  String get fullName;
  @override
  String? get avatarImageFile;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_NewUserModelCopyWith<_$_NewUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
