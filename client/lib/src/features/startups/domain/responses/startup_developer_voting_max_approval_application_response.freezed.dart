// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_developer_voting_max_approval_application_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupDeveloperVotingMaxApprovalApplicationResponse
    _$StartupDeveloperVotingMaxApprovalApplicationResponseFromJson(
        Map<String, dynamic> json) {
  return _StartupDeveloperVotingMaxApprovalApplicationResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupDeveloperVotingMaxApprovalApplicationResponse {
  String get id => throw _privateConstructorUsedError;
  String get startupId => throw _privateConstructorUsedError;
  String get developerId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Developer get developer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<
          StartupDeveloperVotingMaxApprovalApplicationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<
    $Res> {
  factory $StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith(
          StartupDeveloperVotingMaxApprovalApplicationResponse value,
          $Res Function(StartupDeveloperVotingMaxApprovalApplicationResponse)
              then) =
      _$StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl<$Res,
          StartupDeveloperVotingMaxApprovalApplicationResponse>;
  @useResult
  $Res call(
      {String id,
      String startupId,
      String developerId,
      String message,
      Developer developer});
}

/// @nodoc
class _$StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl<$Res,
        $Val extends StartupDeveloperVotingMaxApprovalApplicationResponse>
    implements
        $StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<$Res> {
  _$StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl(
      this._value, this._then);

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
    Object? developer = freezed,
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
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<
        $Res>
    implements
        $StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<$Res> {
  factory _$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith(
          _$_StartupDeveloperVotingMaxApprovalApplicationResponse value,
          $Res Function(_$_StartupDeveloperVotingMaxApprovalApplicationResponse)
              then) =
      __$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl<
          $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String startupId,
      String developerId,
      String message,
      Developer developer});
}

/// @nodoc
class __$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl<
        $Res>
    extends _$StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl<
        $Res, _$_StartupDeveloperVotingMaxApprovalApplicationResponse>
    implements
        _$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<$Res> {
  __$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl(
      _$_StartupDeveloperVotingMaxApprovalApplicationResponse _value,
      $Res Function(_$_StartupDeveloperVotingMaxApprovalApplicationResponse)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? developerId = null,
    Object? message = null,
    Object? developer = freezed,
  }) {
    return _then(_$_StartupDeveloperVotingMaxApprovalApplicationResponse(
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
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupDeveloperVotingMaxApprovalApplicationResponse
    implements _StartupDeveloperVotingMaxApprovalApplicationResponse {
  _$_StartupDeveloperVotingMaxApprovalApplicationResponse(
      {required this.id,
      required this.startupId,
      required this.developerId,
      required this.message,
      required this.developer});

  factory _$_StartupDeveloperVotingMaxApprovalApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_StartupDeveloperVotingMaxApprovalApplicationResponseFromJson(json);

  @override
  final String id;
  @override
  final String startupId;
  @override
  final String developerId;
  @override
  final String message;
  @override
  final Developer developer;

  @override
  String toString() {
    return 'StartupDeveloperVotingMaxApprovalApplicationResponse(id: $id, startupId: $startupId, developerId: $developerId, message: $message, developer: $developer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupDeveloperVotingMaxApprovalApplicationResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.developerId, developerId) ||
                other.developerId == developerId) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.developer, developer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startupId, developerId,
      message, const DeepCollectionEquality().hash(developer));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<
          _$_StartupDeveloperVotingMaxApprovalApplicationResponse>
      get copyWith =>
          __$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWithImpl<
                  _$_StartupDeveloperVotingMaxApprovalApplicationResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupDeveloperVotingMaxApprovalApplicationResponseToJson(
      this,
    );
  }
}

abstract class _StartupDeveloperVotingMaxApprovalApplicationResponse
    implements StartupDeveloperVotingMaxApprovalApplicationResponse {
  factory _StartupDeveloperVotingMaxApprovalApplicationResponse(
          {required final String id,
          required final String startupId,
          required final String developerId,
          required final String message,
          required final Developer developer}) =
      _$_StartupDeveloperVotingMaxApprovalApplicationResponse;

  factory _StartupDeveloperVotingMaxApprovalApplicationResponse.fromJson(
          Map<String, dynamic> json) =
      _$_StartupDeveloperVotingMaxApprovalApplicationResponse.fromJson;

  @override
  String get id;
  @override
  String get startupId;
  @override
  String get developerId;
  @override
  String get message;
  @override
  Developer get developer;
  @override
  @JsonKey(ignore: true)
  _$$_StartupDeveloperVotingMaxApprovalApplicationResponseCopyWith<
          _$_StartupDeveloperVotingMaxApprovalApplicationResponse>
      get copyWith => throw _privateConstructorUsedError;
}
