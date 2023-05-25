// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_startup_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchStartupsQuery _$SearchStartupsQueryFromJson(Map<String, dynamic> json) {
  return _SearchStartupsQuery.fromJson(json);
}

/// @nodoc
mixin _$SearchStartupsQuery {
  int? get page => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  StartupStatus? get status => throw _privateConstructorUsedError;
  String? get startuperId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchStartupsQueryCopyWith<SearchStartupsQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStartupsQueryCopyWith<$Res> {
  factory $SearchStartupsQueryCopyWith(
          SearchStartupsQuery value, $Res Function(SearchStartupsQuery) then) =
      _$SearchStartupsQueryCopyWithImpl<$Res, SearchStartupsQuery>;
  @useResult
  $Res call({int? page, int? size, StartupStatus? status, String? startuperId});
}

/// @nodoc
class _$SearchStartupsQueryCopyWithImpl<$Res, $Val extends SearchStartupsQuery>
    implements $SearchStartupsQueryCopyWith<$Res> {
  _$SearchStartupsQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? status = freezed,
    Object? startuperId = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StartupStatus?,
      startuperId: freezed == startuperId
          ? _value.startuperId
          : startuperId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStartupsQueryCopyWith<$Res>
    implements $SearchStartupsQueryCopyWith<$Res> {
  factory _$$_SearchStartupsQueryCopyWith(_$_SearchStartupsQuery value,
          $Res Function(_$_SearchStartupsQuery) then) =
      __$$_SearchStartupsQueryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? size, StartupStatus? status, String? startuperId});
}

/// @nodoc
class __$$_SearchStartupsQueryCopyWithImpl<$Res>
    extends _$SearchStartupsQueryCopyWithImpl<$Res, _$_SearchStartupsQuery>
    implements _$$_SearchStartupsQueryCopyWith<$Res> {
  __$$_SearchStartupsQueryCopyWithImpl(_$_SearchStartupsQuery _value,
      $Res Function(_$_SearchStartupsQuery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? status = freezed,
    Object? startuperId = freezed,
  }) {
    return _then(_$_SearchStartupsQuery(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StartupStatus?,
      startuperId: freezed == startuperId
          ? _value.startuperId
          : startuperId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchStartupsQuery implements _SearchStartupsQuery {
  _$_SearchStartupsQuery({this.page, this.size, this.status, this.startuperId});

  factory _$_SearchStartupsQuery.fromJson(Map<String, dynamic> json) =>
      _$$_SearchStartupsQueryFromJson(json);

  @override
  final int? page;
  @override
  final int? size;
  @override
  final StartupStatus? status;
  @override
  final String? startuperId;

  @override
  String toString() {
    return 'SearchStartupsQuery(page: $page, size: $size, status: $status, startuperId: $startuperId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStartupsQuery &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startuperId, startuperId) ||
                other.startuperId == startuperId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, status, startuperId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStartupsQueryCopyWith<_$_SearchStartupsQuery> get copyWith =>
      __$$_SearchStartupsQueryCopyWithImpl<_$_SearchStartupsQuery>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchStartupsQueryToJson(
      this,
    );
  }
}

abstract class _SearchStartupsQuery implements SearchStartupsQuery {
  factory _SearchStartupsQuery(
      {final int? page,
      final int? size,
      final StartupStatus? status,
      final String? startuperId}) = _$_SearchStartupsQuery;

  factory _SearchStartupsQuery.fromJson(Map<String, dynamic> json) =
      _$_SearchStartupsQuery.fromJson;

  @override
  int? get page;
  @override
  int? get size;
  @override
  StartupStatus? get status;
  @override
  String? get startuperId;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStartupsQueryCopyWith<_$_SearchStartupsQuery> get copyWith =>
      throw _privateConstructorUsedError;
}
