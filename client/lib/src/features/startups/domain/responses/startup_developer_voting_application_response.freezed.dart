// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_developer_voting_application_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupDeveloperVotingApplicationResponse
    _$StartupDeveloperVotingApplicationResponseFromJson(
        Map<String, dynamic> json) {
  return _StartupDeveloperVotingApplicationResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupDeveloperVotingApplicationResponse {
  String get id => throw _privateConstructorUsedError;
  String get startupId => throw _privateConstructorUsedError;
  String get developerId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Developer get developer => throw _privateConstructorUsedError;
  double get approval => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupDeveloperVotingApplicationResponseCopyWith<
          StartupDeveloperVotingApplicationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupDeveloperVotingApplicationResponseCopyWith<$Res> {
  factory $StartupDeveloperVotingApplicationResponseCopyWith(
          StartupDeveloperVotingApplicationResponse value,
          $Res Function(StartupDeveloperVotingApplicationResponse) then) =
      _$StartupDeveloperVotingApplicationResponseCopyWithImpl<$Res,
          StartupDeveloperVotingApplicationResponse>;
  @useResult
  $Res call(
      {String id,
      String startupId,
      String developerId,
      String message,
      Developer developer,
      double approval});
}

/// @nodoc
class _$StartupDeveloperVotingApplicationResponseCopyWithImpl<$Res,
        $Val extends StartupDeveloperVotingApplicationResponse>
    implements $StartupDeveloperVotingApplicationResponseCopyWith<$Res> {
  _$StartupDeveloperVotingApplicationResponseCopyWithImpl(
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
    Object? approval = null,
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
      approval: null == approval
          ? _value.approval
          : approval // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupDeveloperVotingApplicationResponseCopyWith<$Res>
    implements $StartupDeveloperVotingApplicationResponseCopyWith<$Res> {
  factory _$$_StartupDeveloperVotingApplicationResponseCopyWith(
          _$_StartupDeveloperVotingApplicationResponse value,
          $Res Function(_$_StartupDeveloperVotingApplicationResponse) then) =
      __$$_StartupDeveloperVotingApplicationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String startupId,
      String developerId,
      String message,
      Developer developer,
      double approval});
}

/// @nodoc
class __$$_StartupDeveloperVotingApplicationResponseCopyWithImpl<$Res>
    extends _$StartupDeveloperVotingApplicationResponseCopyWithImpl<$Res,
        _$_StartupDeveloperVotingApplicationResponse>
    implements _$$_StartupDeveloperVotingApplicationResponseCopyWith<$Res> {
  __$$_StartupDeveloperVotingApplicationResponseCopyWithImpl(
      _$_StartupDeveloperVotingApplicationResponse _value,
      $Res Function(_$_StartupDeveloperVotingApplicationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startupId = null,
    Object? developerId = null,
    Object? message = null,
    Object? developer = freezed,
    Object? approval = null,
  }) {
    return _then(_$_StartupDeveloperVotingApplicationResponse(
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
      approval: null == approval
          ? _value.approval
          : approval // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupDeveloperVotingApplicationResponse
    implements _StartupDeveloperVotingApplicationResponse {
  _$_StartupDeveloperVotingApplicationResponse(
      {required this.id,
      required this.startupId,
      required this.developerId,
      required this.message,
      required this.developer,
      required this.approval});

  factory _$_StartupDeveloperVotingApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_StartupDeveloperVotingApplicationResponseFromJson(json);

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
  final double approval;

  @override
  String toString() {
    return 'StartupDeveloperVotingApplicationResponse(id: $id, startupId: $startupId, developerId: $developerId, message: $message, developer: $developer, approval: $approval)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupDeveloperVotingApplicationResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.developerId, developerId) ||
                other.developerId == developerId) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.developer, developer) &&
            (identical(other.approval, approval) ||
                other.approval == approval));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startupId, developerId,
      message, const DeepCollectionEquality().hash(developer), approval);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupDeveloperVotingApplicationResponseCopyWith<
          _$_StartupDeveloperVotingApplicationResponse>
      get copyWith =>
          __$$_StartupDeveloperVotingApplicationResponseCopyWithImpl<
              _$_StartupDeveloperVotingApplicationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupDeveloperVotingApplicationResponseToJson(
      this,
    );
  }
}

abstract class _StartupDeveloperVotingApplicationResponse
    implements StartupDeveloperVotingApplicationResponse {
  factory _StartupDeveloperVotingApplicationResponse(
          {required final String id,
          required final String startupId,
          required final String developerId,
          required final String message,
          required final Developer developer,
          required final double approval}) =
      _$_StartupDeveloperVotingApplicationResponse;

  factory _StartupDeveloperVotingApplicationResponse.fromJson(
          Map<String, dynamic> json) =
      _$_StartupDeveloperVotingApplicationResponse.fromJson;

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
  double get approval;
  @override
  @JsonKey(ignore: true)
  _$$_StartupDeveloperVotingApplicationResponseCopyWith<
          _$_StartupDeveloperVotingApplicationResponse>
      get copyWith => throw _privateConstructorUsedError;
}
