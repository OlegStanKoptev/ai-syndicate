// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_verification_failed_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartupVerificationFailedResponse _$StartupVerificationFailedResponseFromJson(
    Map<String, dynamic> json) {
  return _StartupVerificationFailedResponse.fromJson(json);
}

/// @nodoc
mixin _$StartupVerificationFailedResponse {
  List<StartupVerificationVoteModel> get nayVotes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartupVerificationFailedResponseCopyWith<StartupVerificationFailedResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartupVerificationFailedResponseCopyWith<$Res> {
  factory $StartupVerificationFailedResponseCopyWith(
          StartupVerificationFailedResponse value,
          $Res Function(StartupVerificationFailedResponse) then) =
      _$StartupVerificationFailedResponseCopyWithImpl<$Res,
          StartupVerificationFailedResponse>;
  @useResult
  $Res call({List<StartupVerificationVoteModel> nayVotes});
}

/// @nodoc
class _$StartupVerificationFailedResponseCopyWithImpl<$Res,
        $Val extends StartupVerificationFailedResponse>
    implements $StartupVerificationFailedResponseCopyWith<$Res> {
  _$StartupVerificationFailedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nayVotes = null,
  }) {
    return _then(_value.copyWith(
      nayVotes: null == nayVotes
          ? _value.nayVotes
          : nayVotes // ignore: cast_nullable_to_non_nullable
              as List<StartupVerificationVoteModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartupVerificationFailedResponseCopyWith<$Res>
    implements $StartupVerificationFailedResponseCopyWith<$Res> {
  factory _$$_StartupVerificationFailedResponseCopyWith(
          _$_StartupVerificationFailedResponse value,
          $Res Function(_$_StartupVerificationFailedResponse) then) =
      __$$_StartupVerificationFailedResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StartupVerificationVoteModel> nayVotes});
}

/// @nodoc
class __$$_StartupVerificationFailedResponseCopyWithImpl<$Res>
    extends _$StartupVerificationFailedResponseCopyWithImpl<$Res,
        _$_StartupVerificationFailedResponse>
    implements _$$_StartupVerificationFailedResponseCopyWith<$Res> {
  __$$_StartupVerificationFailedResponseCopyWithImpl(
      _$_StartupVerificationFailedResponse _value,
      $Res Function(_$_StartupVerificationFailedResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nayVotes = null,
  }) {
    return _then(_$_StartupVerificationFailedResponse(
      nayVotes: null == nayVotes
          ? _value._nayVotes
          : nayVotes // ignore: cast_nullable_to_non_nullable
              as List<StartupVerificationVoteModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartupVerificationFailedResponse
    implements _StartupVerificationFailedResponse {
  _$_StartupVerificationFailedResponse(
      {required final List<StartupVerificationVoteModel> nayVotes})
      : _nayVotes = nayVotes;

  factory _$_StartupVerificationFailedResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_StartupVerificationFailedResponseFromJson(json);

  final List<StartupVerificationVoteModel> _nayVotes;
  @override
  List<StartupVerificationVoteModel> get nayVotes {
    if (_nayVotes is EqualUnmodifiableListView) return _nayVotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nayVotes);
  }

  @override
  String toString() {
    return 'StartupVerificationFailedResponse(nayVotes: $nayVotes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartupVerificationFailedResponse &&
            const DeepCollectionEquality().equals(other._nayVotes, _nayVotes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_nayVotes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartupVerificationFailedResponseCopyWith<
          _$_StartupVerificationFailedResponse>
      get copyWith => __$$_StartupVerificationFailedResponseCopyWithImpl<
          _$_StartupVerificationFailedResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartupVerificationFailedResponseToJson(
      this,
    );
  }
}

abstract class _StartupVerificationFailedResponse
    implements StartupVerificationFailedResponse {
  factory _StartupVerificationFailedResponse(
          {required final List<StartupVerificationVoteModel> nayVotes}) =
      _$_StartupVerificationFailedResponse;

  factory _StartupVerificationFailedResponse.fromJson(
          Map<String, dynamic> json) =
      _$_StartupVerificationFailedResponse.fromJson;

  @override
  List<StartupVerificationVoteModel> get nayVotes;
  @override
  @JsonKey(ignore: true)
  _$$_StartupVerificationFailedResponseCopyWith<
          _$_StartupVerificationFailedResponse>
      get copyWith => throw _privateConstructorUsedError;
}
