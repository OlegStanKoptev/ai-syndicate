// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_startup_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchStartupResponse _$SearchStartupResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchStartupResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchStartupResponse {
  int get size => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
  List<ShortStartupModel> get data => throw _privateConstructorUsedError;
  String? get logoFile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchStartupResponseCopyWith<SearchStartupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStartupResponseCopyWith<$Res> {
  factory $SearchStartupResponseCopyWith(SearchStartupResponse value,
          $Res Function(SearchStartupResponse) then) =
      _$SearchStartupResponseCopyWithImpl<$Res, SearchStartupResponse>;
  @useResult
  $Res call(
      {int size,
      int page,
      int total,
      int totalPages,
      int from,
      int to,
      List<ShortStartupModel> data,
      String? logoFile});
}

/// @nodoc
class _$SearchStartupResponseCopyWithImpl<$Res,
        $Val extends SearchStartupResponse>
    implements $SearchStartupResponseCopyWith<$Res> {
  _$SearchStartupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = null,
    Object? total = null,
    Object? totalPages = null,
    Object? from = null,
    Object? to = null,
    Object? data = null,
    Object? logoFile = freezed,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShortStartupModel>,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStartupResponseCopyWith<$Res>
    implements $SearchStartupResponseCopyWith<$Res> {
  factory _$$_SearchStartupResponseCopyWith(_$_SearchStartupResponse value,
          $Res Function(_$_SearchStartupResponse) then) =
      __$$_SearchStartupResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int size,
      int page,
      int total,
      int totalPages,
      int from,
      int to,
      List<ShortStartupModel> data,
      String? logoFile});
}

/// @nodoc
class __$$_SearchStartupResponseCopyWithImpl<$Res>
    extends _$SearchStartupResponseCopyWithImpl<$Res, _$_SearchStartupResponse>
    implements _$$_SearchStartupResponseCopyWith<$Res> {
  __$$_SearchStartupResponseCopyWithImpl(_$_SearchStartupResponse _value,
      $Res Function(_$_SearchStartupResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = null,
    Object? total = null,
    Object? totalPages = null,
    Object? from = null,
    Object? to = null,
    Object? data = null,
    Object? logoFile = freezed,
  }) {
    return _then(_$_SearchStartupResponse(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShortStartupModel>,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchStartupResponse implements _SearchStartupResponse {
  _$_SearchStartupResponse(
      {required this.size,
      required this.page,
      required this.total,
      required this.totalPages,
      required this.from,
      required this.to,
      required final List<ShortStartupModel> data,
      this.logoFile})
      : _data = data;

  factory _$_SearchStartupResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchStartupResponseFromJson(json);

  @override
  final int size;
  @override
  final int page;
  @override
  final int total;
  @override
  final int totalPages;
  @override
  final int from;
  @override
  final int to;
  final List<ShortStartupModel> _data;
  @override
  List<ShortStartupModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String? logoFile;

  @override
  String toString() {
    return 'SearchStartupResponse(size: $size, page: $page, total: $total, totalPages: $totalPages, from: $from, to: $to, data: $data, logoFile: $logoFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchStartupResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.logoFile, logoFile) ||
                other.logoFile == logoFile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, size, page, total, totalPages,
      from, to, const DeepCollectionEquality().hash(_data), logoFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStartupResponseCopyWith<_$_SearchStartupResponse> get copyWith =>
      __$$_SearchStartupResponseCopyWithImpl<_$_SearchStartupResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchStartupResponseToJson(
      this,
    );
  }
}

abstract class _SearchStartupResponse implements SearchStartupResponse {
  factory _SearchStartupResponse(
      {required final int size,
      required final int page,
      required final int total,
      required final int totalPages,
      required final int from,
      required final int to,
      required final List<ShortStartupModel> data,
      final String? logoFile}) = _$_SearchStartupResponse;

  factory _SearchStartupResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchStartupResponse.fromJson;

  @override
  int get size;
  @override
  int get page;
  @override
  int get total;
  @override
  int get totalPages;
  @override
  int get from;
  @override
  int get to;
  @override
  List<ShortStartupModel> get data;
  @override
  String? get logoFile;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStartupResponseCopyWith<_$_SearchStartupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
