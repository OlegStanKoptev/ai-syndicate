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
    required TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)
        user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
        user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Admin implements Admin {
  _$Admin(
      {required this.id,
      required this.email,
      required this.fullName,
      final String? $type})
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
  String toString() {
    return 'UserModel.admin(id: $id, email: $email, fullName: $fullName)';
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
    required TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)
        user,
  }) {
    return admin(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
        user,
  }) {
    return admin?.call(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
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
  factory Admin(
      {required final String id,
      required final String email,
      required final String fullName}) = _$Admin;

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
  $Res call(
      {String id,
      String email,
      String fullName,
      String phone,
      String? avatarImageFile,
      String orgName,
      String shortOrgName,
      String inn,
      String ogrn,
      String kpp,
      String legalAddress,
      String actualAddress,
      String website});
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
    Object? phone = null,
    Object? avatarImageFile = freezed,
    Object? orgName = null,
    Object? shortOrgName = null,
    Object? inn = null,
    Object? ogrn = null,
    Object? kpp = null,
    Object? legalAddress = null,
    Object? actualAddress = null,
    Object? website = null,
  }) {
    return _then(_$Developer(
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
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatarImageFile: freezed == avatarImageFile
          ? _value.avatarImageFile
          : avatarImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      orgName: null == orgName
          ? _value.orgName
          : orgName // ignore: cast_nullable_to_non_nullable
              as String,
      shortOrgName: null == shortOrgName
          ? _value.shortOrgName
          : shortOrgName // ignore: cast_nullable_to_non_nullable
              as String,
      inn: null == inn
          ? _value.inn
          : inn // ignore: cast_nullable_to_non_nullable
              as String,
      ogrn: null == ogrn
          ? _value.ogrn
          : ogrn // ignore: cast_nullable_to_non_nullable
              as String,
      kpp: null == kpp
          ? _value.kpp
          : kpp // ignore: cast_nullable_to_non_nullable
              as String,
      legalAddress: null == legalAddress
          ? _value.legalAddress
          : legalAddress // ignore: cast_nullable_to_non_nullable
              as String,
      actualAddress: null == actualAddress
          ? _value.actualAddress
          : actualAddress // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Developer implements Developer {
  _$Developer(
      {required this.id,
      required this.email,
      required this.fullName,
      required this.phone,
      this.avatarImageFile,
      required this.orgName,
      required this.shortOrgName,
      required this.inn,
      required this.ogrn,
      required this.kpp,
      required this.legalAddress,
      required this.actualAddress,
      required this.website,
      final String? $type})
      : $type = $type ?? 'developer';

  factory _$Developer.fromJson(Map<String, dynamic> json) =>
      _$$DeveloperFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String phone;
  @override
  final String? avatarImageFile;
  @override
  final String orgName;
  @override
  final String shortOrgName;
  @override
  final String inn;
  @override
  final String ogrn;
  @override
  final String kpp;
  @override
  final String legalAddress;
  @override
  final String actualAddress;
  @override
  final String website;

  @JsonKey(name: 'role')
  final String $type;

  @override
  String toString() {
    return 'UserModel.developer(id: $id, email: $email, fullName: $fullName, phone: $phone, avatarImageFile: $avatarImageFile, orgName: $orgName, shortOrgName: $shortOrgName, inn: $inn, ogrn: $ogrn, kpp: $kpp, legalAddress: $legalAddress, actualAddress: $actualAddress, website: $website)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Developer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatarImageFile, avatarImageFile) ||
                other.avatarImageFile == avatarImageFile) &&
            (identical(other.orgName, orgName) || other.orgName == orgName) &&
            (identical(other.shortOrgName, shortOrgName) ||
                other.shortOrgName == shortOrgName) &&
            (identical(other.inn, inn) || other.inn == inn) &&
            (identical(other.ogrn, ogrn) || other.ogrn == ogrn) &&
            (identical(other.kpp, kpp) || other.kpp == kpp) &&
            (identical(other.legalAddress, legalAddress) ||
                other.legalAddress == legalAddress) &&
            (identical(other.actualAddress, actualAddress) ||
                other.actualAddress == actualAddress) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      fullName,
      phone,
      avatarImageFile,
      orgName,
      shortOrgName,
      inn,
      ogrn,
      kpp,
      legalAddress,
      actualAddress,
      website);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeveloperCopyWith<_$Developer> get copyWith =>
      __$$DeveloperCopyWithImpl<_$Developer>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String email, String fullName) admin,
    required TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)
        user,
  }) {
    return developer(id, email, fullName, phone, avatarImageFile, orgName,
        shortOrgName, inn, ogrn, kpp, legalAddress, actualAddress, website);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
        user,
  }) {
    return developer?.call(id, email, fullName, phone, avatarImageFile, orgName,
        shortOrgName, inn, ogrn, kpp, legalAddress, actualAddress, website);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
        user,
    required TResult orElse(),
  }) {
    if (developer != null) {
      return developer(id, email, fullName, phone, avatarImageFile, orgName,
          shortOrgName, inn, ogrn, kpp, legalAddress, actualAddress, website);
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
      {required final String id,
      required final String email,
      required final String fullName,
      required final String phone,
      final String? avatarImageFile,
      required final String orgName,
      required final String shortOrgName,
      required final String inn,
      required final String ogrn,
      required final String kpp,
      required final String legalAddress,
      required final String actualAddress,
      required final String website}) = _$Developer;

  factory Developer.fromJson(Map<String, dynamic> json) = _$Developer.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  String get phone;
  String? get avatarImageFile;
  String get orgName;
  String get shortOrgName;
  String get inn;
  String get ogrn;
  String get kpp;
  String get legalAddress;
  String get actualAddress;
  String get website;
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Expert implements Expert {
  _$Expert(
      {required this.id,
      required this.email,
      required this.fullName,
      final String? $type})
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
  String toString() {
    return 'UserModel.expert(id: $id, email: $email, fullName: $fullName)';
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
    required TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)
        user,
  }) {
    return expert(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
        user,
  }) {
    return expert?.call(id, email, fullName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
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
  factory Expert(
      {required final String id,
      required final String email,
      required final String fullName}) = _$Expert;

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
  $Res call(
      {String id,
      String email,
      String fullName,
      String? avatarImageFile,
      int? balance});
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
    Object? avatarImageFile = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$User(
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
      avatarImageFile: freezed == avatarImageFile
          ? _value.avatarImageFile
          : avatarImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User implements User {
  _$User(
      {required this.id,
      required this.email,
      required this.fullName,
      this.avatarImageFile,
      this.balance,
      final String? $type})
      : $type = $type ?? 'user';

  factory _$User.fromJson(Map<String, dynamic> json) => _$$UserFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String fullName;
  @override
  final String? avatarImageFile;
  @override
  final int? balance;

  @JsonKey(name: 'role')
  final String $type;

  @override
  String toString() {
    return 'UserModel.user(id: $id, email: $email, fullName: $fullName, avatarImageFile: $avatarImageFile, balance: $balance)';
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
            (identical(other.avatarImageFile, avatarImageFile) ||
                other.avatarImageFile == avatarImageFile) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, fullName, avatarImageFile, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCopyWith<_$User> get copyWith =>
      __$$UserCopyWithImpl<_$User>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String email, String fullName) admin,
    required TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)
        developer,
    required TResult Function(String id, String email, String fullName) expert,
    required TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)
        user,
  }) {
    return user(id, email, fullName, avatarImageFile, balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String email, String fullName)? admin,
    TResult? Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult? Function(String id, String email, String fullName)? expert,
    TResult? Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
        user,
  }) {
    return user?.call(id, email, fullName, avatarImageFile, balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String email, String fullName)? admin,
    TResult Function(
            String id,
            String email,
            String fullName,
            String phone,
            String? avatarImageFile,
            String orgName,
            String shortOrgName,
            String inn,
            String ogrn,
            String kpp,
            String legalAddress,
            String actualAddress,
            String website)?
        developer,
    TResult Function(String id, String email, String fullName)? expert,
    TResult Function(String id, String email, String fullName,
            String? avatarImageFile, int? balance)?
        user,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(id, email, fullName, avatarImageFile, balance);
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
  factory User(
      {required final String id,
      required final String email,
      required final String fullName,
      final String? avatarImageFile,
      final int? balance}) = _$User;

  factory User.fromJson(Map<String, dynamic> json) = _$User.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get fullName;
  String? get avatarImageFile;
  int? get balance;
  @override
  @JsonKey(ignore: true)
  _$$UserCopyWith<_$User> get copyWith => throw _privateConstructorUsedError;
}
