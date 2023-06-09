// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_startup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FullStartupModel _$FullStartupModelFromJson(Map<String, dynamic> json) {
  return _FullStartupModel.fromJson(json);
}

/// @nodoc
mixin _$FullStartupModel {
  String get id => throw _privateConstructorUsedError;
  StartupStatus get status => throw _privateConstructorUsedError;
  User get startuper => throw _privateConstructorUsedError;
  int get targetFinancing => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get logoFile => throw _privateConstructorUsedError;
  String get specificationFile => throw _privateConstructorUsedError;
  String? get businessPlanFile => throw _privateConstructorUsedError;
  String? get presentationFile => throw _privateConstructorUsedError;
  StartupVerificationResponse? get verification =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_failed')
  StartupVerificationFailedResponse? get verificationFailed =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_succeded')
  Map<String, Object?>? get verificationSucceded =>
      throw _privateConstructorUsedError;
  StartupFinancingResponse? get financing => throw _privateConstructorUsedError;
  @JsonKey(name: 'financing_failed')
  Map<String, Object?>? get financingFailed =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'financing_succeded')
  Map<String, Object?>? get financingSucceded =>
      throw _privateConstructorUsedError;
  StartupDeveloperApplicationsResponse? get developerApplication =>
      throw _privateConstructorUsedError;
  StartupDeveloperVotingResponse? get developerVoting =>
      throw _privateConstructorUsedError;
  StartupDevelopmentResponse? get development =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FullStartupModelCopyWith<FullStartupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullStartupModelCopyWith<$Res> {
  factory $FullStartupModelCopyWith(
          FullStartupModel value, $Res Function(FullStartupModel) then) =
      _$FullStartupModelCopyWithImpl<$Res, FullStartupModel>;
  @useResult
  $Res call(
      {String id,
      StartupStatus status,
      User startuper,
      int targetFinancing,
      String name,
      String description,
      String? logoFile,
      String specificationFile,
      String? businessPlanFile,
      String? presentationFile,
      StartupVerificationResponse? verification,
      @JsonKey(name: 'verification_failed')
          StartupVerificationFailedResponse? verificationFailed,
      @JsonKey(name: 'verification_succeded')
          Map<String, Object?>? verificationSucceded,
      StartupFinancingResponse? financing,
      @JsonKey(name: 'financing_failed')
          Map<String, Object?>? financingFailed,
      @JsonKey(name: 'financing_succeded')
          Map<String, Object?>? financingSucceded,
      StartupDeveloperApplicationsResponse? developerApplication,
      StartupDeveloperVotingResponse? developerVoting,
      StartupDevelopmentResponse? development});

  $StartupVerificationResponseCopyWith<$Res>? get verification;
  $StartupVerificationFailedResponseCopyWith<$Res>? get verificationFailed;
  $StartupFinancingResponseCopyWith<$Res>? get financing;
  $StartupDeveloperApplicationsResponseCopyWith<$Res>? get developerApplication;
  $StartupDeveloperVotingResponseCopyWith<$Res>? get developerVoting;
  $StartupDevelopmentResponseCopyWith<$Res>? get development;
}

/// @nodoc
class _$FullStartupModelCopyWithImpl<$Res, $Val extends FullStartupModel>
    implements $FullStartupModelCopyWith<$Res> {
  _$FullStartupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? startuper = freezed,
    Object? targetFinancing = null,
    Object? name = null,
    Object? description = null,
    Object? logoFile = freezed,
    Object? specificationFile = null,
    Object? businessPlanFile = freezed,
    Object? presentationFile = freezed,
    Object? verification = freezed,
    Object? verificationFailed = freezed,
    Object? verificationSucceded = freezed,
    Object? financing = freezed,
    Object? financingFailed = freezed,
    Object? financingSucceded = freezed,
    Object? developerApplication = freezed,
    Object? developerVoting = freezed,
    Object? development = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StartupStatus,
      startuper: freezed == startuper
          ? _value.startuper
          : startuper // ignore: cast_nullable_to_non_nullable
              as User,
      targetFinancing: null == targetFinancing
          ? _value.targetFinancing
          : targetFinancing // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as String?,
      specificationFile: null == specificationFile
          ? _value.specificationFile
          : specificationFile // ignore: cast_nullable_to_non_nullable
              as String,
      businessPlanFile: freezed == businessPlanFile
          ? _value.businessPlanFile
          : businessPlanFile // ignore: cast_nullable_to_non_nullable
              as String?,
      presentationFile: freezed == presentationFile
          ? _value.presentationFile
          : presentationFile // ignore: cast_nullable_to_non_nullable
              as String?,
      verification: freezed == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as StartupVerificationResponse?,
      verificationFailed: freezed == verificationFailed
          ? _value.verificationFailed
          : verificationFailed // ignore: cast_nullable_to_non_nullable
              as StartupVerificationFailedResponse?,
      verificationSucceded: freezed == verificationSucceded
          ? _value.verificationSucceded
          : verificationSucceded // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      financing: freezed == financing
          ? _value.financing
          : financing // ignore: cast_nullable_to_non_nullable
              as StartupFinancingResponse?,
      financingFailed: freezed == financingFailed
          ? _value.financingFailed
          : financingFailed // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      financingSucceded: freezed == financingSucceded
          ? _value.financingSucceded
          : financingSucceded // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      developerApplication: freezed == developerApplication
          ? _value.developerApplication
          : developerApplication // ignore: cast_nullable_to_non_nullable
              as StartupDeveloperApplicationsResponse?,
      developerVoting: freezed == developerVoting
          ? _value.developerVoting
          : developerVoting // ignore: cast_nullable_to_non_nullable
              as StartupDeveloperVotingResponse?,
      development: freezed == development
          ? _value.development
          : development // ignore: cast_nullable_to_non_nullable
              as StartupDevelopmentResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupVerificationResponseCopyWith<$Res>? get verification {
    if (_value.verification == null) {
      return null;
    }

    return $StartupVerificationResponseCopyWith<$Res>(_value.verification!,
        (value) {
      return _then(_value.copyWith(verification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupVerificationFailedResponseCopyWith<$Res>? get verificationFailed {
    if (_value.verificationFailed == null) {
      return null;
    }

    return $StartupVerificationFailedResponseCopyWith<$Res>(
        _value.verificationFailed!, (value) {
      return _then(_value.copyWith(verificationFailed: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupFinancingResponseCopyWith<$Res>? get financing {
    if (_value.financing == null) {
      return null;
    }

    return $StartupFinancingResponseCopyWith<$Res>(_value.financing!, (value) {
      return _then(_value.copyWith(financing: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupDeveloperApplicationsResponseCopyWith<$Res>?
      get developerApplication {
    if (_value.developerApplication == null) {
      return null;
    }

    return $StartupDeveloperApplicationsResponseCopyWith<$Res>(
        _value.developerApplication!, (value) {
      return _then(_value.copyWith(developerApplication: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupDeveloperVotingResponseCopyWith<$Res>? get developerVoting {
    if (_value.developerVoting == null) {
      return null;
    }

    return $StartupDeveloperVotingResponseCopyWith<$Res>(
        _value.developerVoting!, (value) {
      return _then(_value.copyWith(developerVoting: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupDevelopmentResponseCopyWith<$Res>? get development {
    if (_value.development == null) {
      return null;
    }

    return $StartupDevelopmentResponseCopyWith<$Res>(_value.development!,
        (value) {
      return _then(_value.copyWith(development: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FullStartupModelCopyWith<$Res>
    implements $FullStartupModelCopyWith<$Res> {
  factory _$$_FullStartupModelCopyWith(
          _$_FullStartupModel value, $Res Function(_$_FullStartupModel) then) =
      __$$_FullStartupModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      StartupStatus status,
      User startuper,
      int targetFinancing,
      String name,
      String description,
      String? logoFile,
      String specificationFile,
      String? businessPlanFile,
      String? presentationFile,
      StartupVerificationResponse? verification,
      @JsonKey(name: 'verification_failed')
          StartupVerificationFailedResponse? verificationFailed,
      @JsonKey(name: 'verification_succeded')
          Map<String, Object?>? verificationSucceded,
      StartupFinancingResponse? financing,
      @JsonKey(name: 'financing_failed')
          Map<String, Object?>? financingFailed,
      @JsonKey(name: 'financing_succeded')
          Map<String, Object?>? financingSucceded,
      StartupDeveloperApplicationsResponse? developerApplication,
      StartupDeveloperVotingResponse? developerVoting,
      StartupDevelopmentResponse? development});

  @override
  $StartupVerificationResponseCopyWith<$Res>? get verification;
  @override
  $StartupVerificationFailedResponseCopyWith<$Res>? get verificationFailed;
  @override
  $StartupFinancingResponseCopyWith<$Res>? get financing;
  @override
  $StartupDeveloperApplicationsResponseCopyWith<$Res>? get developerApplication;
  @override
  $StartupDeveloperVotingResponseCopyWith<$Res>? get developerVoting;
  @override
  $StartupDevelopmentResponseCopyWith<$Res>? get development;
}

/// @nodoc
class __$$_FullStartupModelCopyWithImpl<$Res>
    extends _$FullStartupModelCopyWithImpl<$Res, _$_FullStartupModel>
    implements _$$_FullStartupModelCopyWith<$Res> {
  __$$_FullStartupModelCopyWithImpl(
      _$_FullStartupModel _value, $Res Function(_$_FullStartupModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? startuper = freezed,
    Object? targetFinancing = null,
    Object? name = null,
    Object? description = null,
    Object? logoFile = freezed,
    Object? specificationFile = null,
    Object? businessPlanFile = freezed,
    Object? presentationFile = freezed,
    Object? verification = freezed,
    Object? verificationFailed = freezed,
    Object? verificationSucceded = freezed,
    Object? financing = freezed,
    Object? financingFailed = freezed,
    Object? financingSucceded = freezed,
    Object? developerApplication = freezed,
    Object? developerVoting = freezed,
    Object? development = freezed,
  }) {
    return _then(_$_FullStartupModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StartupStatus,
      startuper: freezed == startuper
          ? _value.startuper
          : startuper // ignore: cast_nullable_to_non_nullable
              as User,
      targetFinancing: null == targetFinancing
          ? _value.targetFinancing
          : targetFinancing // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as String?,
      specificationFile: null == specificationFile
          ? _value.specificationFile
          : specificationFile // ignore: cast_nullable_to_non_nullable
              as String,
      businessPlanFile: freezed == businessPlanFile
          ? _value.businessPlanFile
          : businessPlanFile // ignore: cast_nullable_to_non_nullable
              as String?,
      presentationFile: freezed == presentationFile
          ? _value.presentationFile
          : presentationFile // ignore: cast_nullable_to_non_nullable
              as String?,
      verification: freezed == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as StartupVerificationResponse?,
      verificationFailed: freezed == verificationFailed
          ? _value.verificationFailed
          : verificationFailed // ignore: cast_nullable_to_non_nullable
              as StartupVerificationFailedResponse?,
      verificationSucceded: freezed == verificationSucceded
          ? _value._verificationSucceded
          : verificationSucceded // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      financing: freezed == financing
          ? _value.financing
          : financing // ignore: cast_nullable_to_non_nullable
              as StartupFinancingResponse?,
      financingFailed: freezed == financingFailed
          ? _value._financingFailed
          : financingFailed // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      financingSucceded: freezed == financingSucceded
          ? _value._financingSucceded
          : financingSucceded // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      developerApplication: freezed == developerApplication
          ? _value.developerApplication
          : developerApplication // ignore: cast_nullable_to_non_nullable
              as StartupDeveloperApplicationsResponse?,
      developerVoting: freezed == developerVoting
          ? _value.developerVoting
          : developerVoting // ignore: cast_nullable_to_non_nullable
              as StartupDeveloperVotingResponse?,
      development: freezed == development
          ? _value.development
          : development // ignore: cast_nullable_to_non_nullable
              as StartupDevelopmentResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FullStartupModel implements _FullStartupModel {
  _$_FullStartupModel(
      {required this.id,
      required this.status,
      required this.startuper,
      required this.targetFinancing,
      required this.name,
      required this.description,
      this.logoFile,
      required this.specificationFile,
      this.businessPlanFile,
      this.presentationFile,
      this.verification,
      @JsonKey(name: 'verification_failed')
          this.verificationFailed,
      @JsonKey(name: 'verification_succeded')
          final Map<String, Object?>? verificationSucceded,
      this.financing,
      @JsonKey(name: 'financing_failed')
          final Map<String, Object?>? financingFailed,
      @JsonKey(name: 'financing_succeded')
          final Map<String, Object?>? financingSucceded,
      this.developerApplication,
      this.developerVoting,
      this.development})
      : _verificationSucceded = verificationSucceded,
        _financingFailed = financingFailed,
        _financingSucceded = financingSucceded;

  factory _$_FullStartupModel.fromJson(Map<String, dynamic> json) =>
      _$$_FullStartupModelFromJson(json);

  @override
  final String id;
  @override
  final StartupStatus status;
  @override
  final User startuper;
  @override
  final int targetFinancing;
  @override
  final String name;
  @override
  final String description;
  @override
  final String? logoFile;
  @override
  final String specificationFile;
  @override
  final String? businessPlanFile;
  @override
  final String? presentationFile;
  @override
  final StartupVerificationResponse? verification;
  @override
  @JsonKey(name: 'verification_failed')
  final StartupVerificationFailedResponse? verificationFailed;
  final Map<String, Object?>? _verificationSucceded;
  @override
  @JsonKey(name: 'verification_succeded')
  Map<String, Object?>? get verificationSucceded {
    final value = _verificationSucceded;
    if (value == null) return null;
    if (_verificationSucceded is EqualUnmodifiableMapView)
      return _verificationSucceded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final StartupFinancingResponse? financing;
  final Map<String, Object?>? _financingFailed;
  @override
  @JsonKey(name: 'financing_failed')
  Map<String, Object?>? get financingFailed {
    final value = _financingFailed;
    if (value == null) return null;
    if (_financingFailed is EqualUnmodifiableMapView) return _financingFailed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, Object?>? _financingSucceded;
  @override
  @JsonKey(name: 'financing_succeded')
  Map<String, Object?>? get financingSucceded {
    final value = _financingSucceded;
    if (value == null) return null;
    if (_financingSucceded is EqualUnmodifiableMapView)
      return _financingSucceded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final StartupDeveloperApplicationsResponse? developerApplication;
  @override
  final StartupDeveloperVotingResponse? developerVoting;
  @override
  final StartupDevelopmentResponse? development;

  @override
  String toString() {
    return 'FullStartupModel(id: $id, status: $status, startuper: $startuper, targetFinancing: $targetFinancing, name: $name, description: $description, logoFile: $logoFile, specificationFile: $specificationFile, businessPlanFile: $businessPlanFile, presentationFile: $presentationFile, verification: $verification, verificationFailed: $verificationFailed, verificationSucceded: $verificationSucceded, financing: $financing, financingFailed: $financingFailed, financingSucceded: $financingSucceded, developerApplication: $developerApplication, developerVoting: $developerVoting, development: $development)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FullStartupModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.startuper, startuper) &&
            (identical(other.targetFinancing, targetFinancing) ||
                other.targetFinancing == targetFinancing) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logoFile, logoFile) ||
                other.logoFile == logoFile) &&
            (identical(other.specificationFile, specificationFile) ||
                other.specificationFile == specificationFile) &&
            (identical(other.businessPlanFile, businessPlanFile) ||
                other.businessPlanFile == businessPlanFile) &&
            (identical(other.presentationFile, presentationFile) ||
                other.presentationFile == presentationFile) &&
            (identical(other.verification, verification) ||
                other.verification == verification) &&
            (identical(other.verificationFailed, verificationFailed) ||
                other.verificationFailed == verificationFailed) &&
            const DeepCollectionEquality()
                .equals(other._verificationSucceded, _verificationSucceded) &&
            (identical(other.financing, financing) ||
                other.financing == financing) &&
            const DeepCollectionEquality()
                .equals(other._financingFailed, _financingFailed) &&
            const DeepCollectionEquality()
                .equals(other._financingSucceded, _financingSucceded) &&
            (identical(other.developerApplication, developerApplication) ||
                other.developerApplication == developerApplication) &&
            (identical(other.developerVoting, developerVoting) ||
                other.developerVoting == developerVoting) &&
            (identical(other.development, development) ||
                other.development == development));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        status,
        const DeepCollectionEquality().hash(startuper),
        targetFinancing,
        name,
        description,
        logoFile,
        specificationFile,
        businessPlanFile,
        presentationFile,
        verification,
        verificationFailed,
        const DeepCollectionEquality().hash(_verificationSucceded),
        financing,
        const DeepCollectionEquality().hash(_financingFailed),
        const DeepCollectionEquality().hash(_financingSucceded),
        developerApplication,
        developerVoting,
        development
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FullStartupModelCopyWith<_$_FullStartupModel> get copyWith =>
      __$$_FullStartupModelCopyWithImpl<_$_FullStartupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FullStartupModelToJson(
      this,
    );
  }
}

abstract class _FullStartupModel implements FullStartupModel {
  factory _FullStartupModel(
      {required final String id,
      required final StartupStatus status,
      required final User startuper,
      required final int targetFinancing,
      required final String name,
      required final String description,
      final String? logoFile,
      required final String specificationFile,
      final String? businessPlanFile,
      final String? presentationFile,
      final StartupVerificationResponse? verification,
      @JsonKey(name: 'verification_failed')
          final StartupVerificationFailedResponse? verificationFailed,
      @JsonKey(name: 'verification_succeded')
          final Map<String, Object?>? verificationSucceded,
      final StartupFinancingResponse? financing,
      @JsonKey(name: 'financing_failed')
          final Map<String, Object?>? financingFailed,
      @JsonKey(name: 'financing_succeded')
          final Map<String, Object?>? financingSucceded,
      final StartupDeveloperApplicationsResponse? developerApplication,
      final StartupDeveloperVotingResponse? developerVoting,
      final StartupDevelopmentResponse? development}) = _$_FullStartupModel;

  factory _FullStartupModel.fromJson(Map<String, dynamic> json) =
      _$_FullStartupModel.fromJson;

  @override
  String get id;
  @override
  StartupStatus get status;
  @override
  User get startuper;
  @override
  int get targetFinancing;
  @override
  String get name;
  @override
  String get description;
  @override
  String? get logoFile;
  @override
  String get specificationFile;
  @override
  String? get businessPlanFile;
  @override
  String? get presentationFile;
  @override
  StartupVerificationResponse? get verification;
  @override
  @JsonKey(name: 'verification_failed')
  StartupVerificationFailedResponse? get verificationFailed;
  @override
  @JsonKey(name: 'verification_succeded')
  Map<String, Object?>? get verificationSucceded;
  @override
  StartupFinancingResponse? get financing;
  @override
  @JsonKey(name: 'financing_failed')
  Map<String, Object?>? get financingFailed;
  @override
  @JsonKey(name: 'financing_succeded')
  Map<String, Object?>? get financingSucceded;
  @override
  StartupDeveloperApplicationsResponse? get developerApplication;
  @override
  StartupDeveloperVotingResponse? get developerVoting;
  @override
  StartupDevelopmentResponse? get development;
  @override
  @JsonKey(ignore: true)
  _$$_FullStartupModelCopyWith<_$_FullStartupModel> get copyWith =>
      throw _privateConstructorUsedError;
}
