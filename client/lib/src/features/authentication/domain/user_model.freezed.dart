// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  switch (json['role']) {
    case 'admin':
      return Admin.fromJson(json);
    case 'developer':
      return Developer.fromJson(json);
    case 'expert':
      return Expert.fromJson(json);
    case 'user':
      return User.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'role', 'UserModel', 'Invalid union type "${json['role']}"!');
  }
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String email, String fullName) admin,
    required TResult Function(String id, String email, String fullName)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(
            String id, String email, String fullName, int balance)
        user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(String id, String email, String fullName)? developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName, int balance)?
        user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(String id, String email, String fullName)? developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName, int balance)?
        user,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Developer value) developer,
    required TResult Function(Expert value) expert,
    required TResult Function(User value) user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Developer value)? developer,
    TResult? Function(Expert value)? expert,
    TResult? Function(User value)? user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Developer value)? developer,
    TResult Function(Expert value)? expert,
    TResult Function(User value)? user,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({String id, String email, String fullName});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$AdminCopyWith(_$Admin value, $Res Function(_$Admin) then) =
      __$$AdminCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String fullName});
}

/// @nodoc
class __$$AdminCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res, _$Admin>
    implements _$$AdminCopyWith<$Res> {
  __$$AdminCopyWithImpl(_$Admin _value, $Res Function(_$Admin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
  }) {
    return _then(_$Admin(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Admin with DiagnosticableTreeMixin implements Admin {
  _$Admin(this.id, this.email, this.fullName, {final String? $type})
      : $type = $type ?? 'admin';

  factory _$Admin.fromJson(Map<String, dynamic> json) => _$$AdminFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;

  @JsonKey(name: 'role')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel.admin(id: $id, email: $email, fullName: $fullName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel.admin'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('fullName', fullName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Admin &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminCopyWith<_$Admin> get copyWith =>
      __$$AdminCopyWithImpl<_$Admin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String email, String fullName) admin,
    required TResult Function(String id, String email, String fullName)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(
            String id, String email, String fullName, int balance)
        user,
  }) {
    return admin(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(String id, String email, String fullName)? developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName, int balance)?
        user,
  }) {
    return admin?.call(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(String id, String email, String fullName)? developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName, int balance)?
        user,
    required TResult orElse(),
  }) {
    if (admin != null) {
      return admin(id, email, fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Developer value) developer,
    required TResult Function(Expert value) expert,
    required TResult Function(User value) user,
  }) {
    return admin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Developer value)? developer,
    TResult? Function(Expert value)? expert,
    TResult? Function(User value)? user,
  }) {
    return admin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Developer value)? developer,
    TResult Function(Expert value)? expert,
    TResult Function(User value)? user,
    required TResult orElse(),
  }) {
    if (admin != null) {
      return admin(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminToJson(
      this,
    );
  }
}

abstract class Admin implements UserModel {
  factory Admin(final String id, final String email, final String fullName) =
      _$Admin;

  factory Admin.fromJson(Map<String, dynamic> json) = _$Admin.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$AdminCopyWith<_$Admin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeveloperCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$DeveloperCopyWith(
          _$Developer value, $Res Function(_$Developer) then) =
      __$$DeveloperCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String fullName});
}

/// @nodoc
class __$$DeveloperCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$Developer>
    implements _$$DeveloperCopyWith<$Res> {
  __$$DeveloperCopyWithImpl(
      _$Developer _value, $Res Function(_$Developer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
  }) {
    return _then(_$Developer(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Developer with DiagnosticableTreeMixin implements Developer {
  _$Developer(this.id, this.email, this.fullName, {final String? $type})
      : $type = $type ?? 'developer';

  factory _$Developer.fromJson(Map<String, dynamic> json) =>
      _$$DeveloperFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;

  @JsonKey(name: 'role')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel.developer(id: $id, email: $email, fullName: $fullName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel.developer'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('fullName', fullName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Developer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeveloperCopyWith<_$Developer> get copyWith =>
      __$$DeveloperCopyWithImpl<_$Developer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String email, String fullName) admin,
    required TResult Function(String id, String email, String fullName)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(
            String id, String email, String fullName, int balance)
        user,
  }) {
    return developer(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(String id, String email, String fullName)? developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName, int balance)?
        user,
  }) {
    return developer?.call(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(String id, String email, String fullName)? developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName, int balance)?
        user,
    required TResult orElse(),
  }) {
    if (developer != null) {
      return developer(id, email, fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Developer value) developer,
    required TResult Function(Expert value) expert,
    required TResult Function(User value) user,
  }) {
    return developer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Developer value)? developer,
    TResult? Function(Expert value)? expert,
    TResult? Function(User value)? user,
  }) {
    return developer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Developer value)? developer,
    TResult Function(Expert value)? expert,
    TResult Function(User value)? user,
    required TResult orElse(),
  }) {
    if (developer != null) {
      return developer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeveloperToJson(
      this,
    );
  }
}

abstract class Developer implements UserModel {
  factory Developer(
      final String id, final String email, final String fullName) = _$Developer;

  factory Developer.fromJson(Map<String, dynamic> json) = _$Developer.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$DeveloperCopyWith<_$Developer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpertCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$ExpertCopyWith(_$Expert value, $Res Function(_$Expert) then) =
      __$$ExpertCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String fullName});
}

/// @nodoc
class __$$ExpertCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$Expert>
    implements _$$ExpertCopyWith<$Res> {
  __$$ExpertCopyWithImpl(_$Expert _value, $Res Function(_$Expert) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
  }) {
    return _then(_$Expert(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Expert with DiagnosticableTreeMixin implements Expert {
  _$Expert(this.id, this.email, this.fullName, {final String? $type})
      : $type = $type ?? 'expert';

  factory _$Expert.fromJson(Map<String, dynamic> json) =>
      _$$ExpertFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;

  @JsonKey(name: 'role')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel.expert(id: $id, email: $email, fullName: $fullName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel.expert'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('fullName', fullName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Expert &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpertCopyWith<_$Expert> get copyWith =>
      __$$ExpertCopyWithImpl<_$Expert>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String email, String fullName) admin,
    required TResult Function(String id, String email, String fullName)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(
            String id, String email, String fullName, int balance)
        user,
  }) {
    return expert(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(String id, String email, String fullName)? developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName, int balance)?
        user,
  }) {
    return expert?.call(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(String id, String email, String fullName)? developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName, int balance)?
        user,
    required TResult orElse(),
  }) {
    if (expert != null) {
      return expert(id, email, fullName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Developer value) developer,
    required TResult Function(Expert value) expert,
    required TResult Function(User value) user,
  }) {
    return expert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Developer value)? developer,
    TResult? Function(Expert value)? expert,
    TResult? Function(User value)? user,
  }) {
    return expert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Developer value)? developer,
    TResult Function(Expert value)? expert,
    TResult Function(User value)? user,
    required TResult orElse(),
  }) {
    if (expert != null) {
      return expert(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpertToJson(
      this,
    );
  }
}

abstract class Expert implements UserModel {
  factory Expert(final String id, final String email, final String fullName) =
      _$Expert;

  factory Expert.fromJson(Map<String, dynamic> json) = _$Expert.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$ExpertCopyWith<_$Expert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$UserCopyWith(_$User value, $Res Function(_$User) then) =
      __$$UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String fullName, int balance});
}

/// @nodoc
class __$$UserCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res, _$User>
    implements _$$UserCopyWith<$Res> {
  __$$UserCopyWithImpl(_$User _value, $Res Function(_$User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? fullName = null,
    Object? balance = null,
  }) {
    return _then(_$User(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User with DiagnosticableTreeMixin implements User {
  _$User(this.id, this.email, this.fullName, this.balance,
      {final String? $type})
      : $type = $type ?? 'user';

  factory _$User.fromJson(Map<String, dynamic> json) => _$$UserFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final int balance;

  @JsonKey(name: 'role')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel.user(id: $id, email: $email, fullName: $fullName, balance: $balance)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel.user'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('balance', balance));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, fullName, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCopyWith<_$User> get copyWith =>
      __$$UserCopyWithImpl<_$User>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String email, String fullName) admin,
    required TResult Function(String id, String email, String fullName)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(
            String id, String email, String fullName, int balance)
        user,
  }) {
    return user(id, email, fullName, balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(String id, String email, String fullName)? developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName, int balance)?
        user,
  }) {
    return user?.call(id, email, fullName, balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(String id, String email, String fullName)? developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName, int balance)?
        user,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(id, email, fullName, balance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Developer value) developer,
    required TResult Function(Expert value) expert,
    required TResult Function(User value) user,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Developer value)? developer,
    TResult? Function(Expert value)? expert,
    TResult? Function(User value)? user,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Developer value)? developer,
    TResult Function(Expert value)? expert,
    TResult Function(User value)? user,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserToJson(
      this,
    );
  }
}

abstract class User implements UserModel {
  factory User(final String id, final String email, final String fullName,
      final int balance) = _$User;

  factory User.fromJson(Map<String, dynamic> json) = _$User.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$UserCopyWith<_$User> get copyWith => throw _privateConstructorUsedError;
}
