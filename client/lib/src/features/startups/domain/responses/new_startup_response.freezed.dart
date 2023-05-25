// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_startup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewStartupResponse _$NewStartupResponseFromJson(Map<String, dynamic> json) {
  return _NewStartupResponse.fromJson(json);
}

/// @nodoc
mixin _$NewStartupResponse {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewStartupResponseCopyWith<NewStartupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewStartupResponseCopyWith<$Res> {
  factory $NewStartupResponseCopyWith(
          NewStartupResponse value, $Res Function(NewStartupResponse) then) =
      _$NewStartupResponseCopyWithImpl<$Res, NewStartupResponse>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$NewStartupResponseCopyWithImpl<$Res, $Val extends NewStartupResponse>
    implements $NewStartupResponseCopyWith<$Res> {
  _$NewStartupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewStartupResponseCopyWith<$Res>
    implements $NewStartupResponseCopyWith<$Res> {
  factory _$$_NewStartupResponseCopyWith(_$_NewStartupResponse value,
          $Res Function(_$_NewStartupResponse) then) =
      __$$_NewStartupResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_NewStartupResponseCopyWithImpl<$Res>
    extends _$NewStartupResponseCopyWithImpl<$Res, _$_NewStartupResponse>
    implements _$$_NewStartupResponseCopyWith<$Res> {
  __$$_NewStartupResponseCopyWithImpl(
      _$_NewStartupResponse _value, $Res Function(_$_NewStartupResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_NewStartupResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewStartupResponse implements _NewStartupResponse {
  _$_NewStartupResponse({required this.id});

  factory _$_NewStartupResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NewStartupResponseFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'NewStartupResponse(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewStartupResponse &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewStartupResponseCopyWith<_$_NewStartupResponse> get copyWith =>
      __$$_NewStartupResponseCopyWithImpl<_$_NewStartupResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewStartupResponseToJson(
      this,
    );
  }
}

abstract class _NewStartupResponse implements NewStartupResponse {
  factory _NewStartupResponse({required final String id}) =
      _$_NewStartupResponse;

  factory _NewStartupResponse.fromJson(Map<String, dynamic> json) =
      _$_NewStartupResponse.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_NewStartupResponseCopyWith<_$_NewStartupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
