// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VoteModel _$VoteModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'startupVote':
      return StartupVote.fromJson(json);
    case 'reportVote':
      return ReportVote.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'VoteModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$VoteModel {
  bool get yea => throw _privateConstructorUsedError;
  String? get nayReason => throw _privateConstructorUsedError;
  String? get expertId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)
        startupVote,
    required TResult Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)
        reportVote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)?
        startupVote,
    TResult? Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)?
        reportVote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)?
        startupVote,
    TResult Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)?
        reportVote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartupVote value) startupVote,
    required TResult Function(ReportVote value) reportVote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartupVote value)? startupVote,
    TResult? Function(ReportVote value)? reportVote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartupVote value)? startupVote,
    TResult Function(ReportVote value)? reportVote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteModelCopyWith<VoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteModelCopyWith<$Res> {
  factory $VoteModelCopyWith(VoteModel value, $Res Function(VoteModel) then) =
      _$VoteModelCopyWithImpl<$Res, VoteModel>;
  @useResult
  $Res call({bool yea, String? nayReason, String? expertId});
}

/// @nodoc
class _$VoteModelCopyWithImpl<$Res, $Val extends VoteModel>
    implements $VoteModelCopyWith<$Res> {
  _$VoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yea = null,
    Object? nayReason = freezed,
    Object? expertId = freezed,
  }) {
    return _then(_value.copyWith(
      yea: null == yea
          ? _value.yea
          : yea // ignore: cast_nullable_to_non_nullable
              as bool,
      nayReason: freezed == nayReason
          ? _value.nayReason
          : nayReason // ignore: cast_nullable_to_non_nullable
              as String?,
      expertId: freezed == expertId
          ? _value.expertId
          : expertId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartupVoteCopyWith<$Res>
    implements $VoteModelCopyWith<$Res> {
  factory _$$StartupVoteCopyWith(
          _$StartupVote value, $Res Function(_$StartupVote) then) =
      __$$StartupVoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool yea,
      String? nayReason,
      String? expertId,
      String? startupId,
      ShortStartupModel? startup});

  $ShortStartupModelCopyWith<$Res>? get startup;
}

/// @nodoc
class __$$StartupVoteCopyWithImpl<$Res>
    extends _$VoteModelCopyWithImpl<$Res, _$StartupVote>
    implements _$$StartupVoteCopyWith<$Res> {
  __$$StartupVoteCopyWithImpl(
      _$StartupVote _value, $Res Function(_$StartupVote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yea = null,
    Object? nayReason = freezed,
    Object? expertId = freezed,
    Object? startupId = freezed,
    Object? startup = freezed,
  }) {
    return _then(_$StartupVote(
      yea: null == yea
          ? _value.yea
          : yea // ignore: cast_nullable_to_non_nullable
              as bool,
      nayReason: freezed == nayReason
          ? _value.nayReason
          : nayReason // ignore: cast_nullable_to_non_nullable
              as String?,
      expertId: freezed == expertId
          ? _value.expertId
          : expertId // ignore: cast_nullable_to_non_nullable
              as String?,
      startupId: freezed == startupId
          ? _value.startupId
          : startupId // ignore: cast_nullable_to_non_nullable
              as String?,
      startup: freezed == startup
          ? _value.startup
          : startup // ignore: cast_nullable_to_non_nullable
              as ShortStartupModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortStartupModelCopyWith<$Res>? get startup {
    if (_value.startup == null) {
      return null;
    }

    return $ShortStartupModelCopyWith<$Res>(_value.startup!, (value) {
      return _then(_value.copyWith(startup: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$StartupVote implements StartupVote {
  const _$StartupVote(
      {required this.yea,
      this.nayReason,
      this.expertId,
      this.startupId,
      this.startup,
      final String? $type})
      : $type = $type ?? 'startupVote';

  factory _$StartupVote.fromJson(Map<String, dynamic> json) =>
      _$$StartupVoteFromJson(json);

  @override
  final bool yea;
  @override
  final String? nayReason;
  @override
  final String? expertId;
  @override
  final String? startupId;
  @override
  final ShortStartupModel? startup;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'VoteModel.startupVote(yea: $yea, nayReason: $nayReason, expertId: $expertId, startupId: $startupId, startup: $startup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartupVote &&
            (identical(other.yea, yea) || other.yea == yea) &&
            (identical(other.nayReason, nayReason) ||
                other.nayReason == nayReason) &&
            (identical(other.expertId, expertId) ||
                other.expertId == expertId) &&
            (identical(other.startupId, startupId) ||
                other.startupId == startupId) &&
            (identical(other.startup, startup) || other.startup == startup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, yea, nayReason, expertId, startupId, startup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartupVoteCopyWith<_$StartupVote> get copyWith =>
      __$$StartupVoteCopyWithImpl<_$StartupVote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)
        startupVote,
    required TResult Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)
        reportVote,
  }) {
    return startupVote(yea, nayReason, expertId, startupId, startup);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)?
        startupVote,
    TResult? Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)?
        reportVote,
  }) {
    return startupVote?.call(yea, nayReason, expertId, startupId, startup);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)?
        startupVote,
    TResult Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)?
        reportVote,
    required TResult orElse(),
  }) {
    if (startupVote != null) {
      return startupVote(yea, nayReason, expertId, startupId, startup);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartupVote value) startupVote,
    required TResult Function(ReportVote value) reportVote,
  }) {
    return startupVote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartupVote value)? startupVote,
    TResult? Function(ReportVote value)? reportVote,
  }) {
    return startupVote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartupVote value)? startupVote,
    TResult Function(ReportVote value)? reportVote,
    required TResult orElse(),
  }) {
    if (startupVote != null) {
      return startupVote(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$StartupVoteToJson(
      this,
    );
  }
}

abstract class StartupVote implements VoteModel {
  const factory StartupVote(
      {required final bool yea,
      final String? nayReason,
      final String? expertId,
      final String? startupId,
      final ShortStartupModel? startup}) = _$StartupVote;

  factory StartupVote.fromJson(Map<String, dynamic> json) =
      _$StartupVote.fromJson;

  @override
  bool get yea;
  @override
  String? get nayReason;
  @override
  String? get expertId;
  String? get startupId;
  ShortStartupModel? get startup;
  @override
  @JsonKey(ignore: true)
  _$$StartupVoteCopyWith<_$StartupVote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReportVoteCopyWith<$Res> implements $VoteModelCopyWith<$Res> {
  factory _$$ReportVoteCopyWith(
          _$ReportVote value, $Res Function(_$ReportVote) then) =
      __$$ReportVoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool yea,
      String? nayReason,
      String? expertId,
      String? reportId,
      StartupReportModel? report});

  $StartupReportModelCopyWith<$Res>? get report;
}

/// @nodoc
class __$$ReportVoteCopyWithImpl<$Res>
    extends _$VoteModelCopyWithImpl<$Res, _$ReportVote>
    implements _$$ReportVoteCopyWith<$Res> {
  __$$ReportVoteCopyWithImpl(
      _$ReportVote _value, $Res Function(_$ReportVote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yea = null,
    Object? nayReason = freezed,
    Object? expertId = freezed,
    Object? reportId = freezed,
    Object? report = freezed,
  }) {
    return _then(_$ReportVote(
      yea: null == yea
          ? _value.yea
          : yea // ignore: cast_nullable_to_non_nullable
              as bool,
      nayReason: freezed == nayReason
          ? _value.nayReason
          : nayReason // ignore: cast_nullable_to_non_nullable
              as String?,
      expertId: freezed == expertId
          ? _value.expertId
          : expertId // ignore: cast_nullable_to_non_nullable
              as String?,
      reportId: freezed == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as StartupReportModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StartupReportModelCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $StartupReportModelCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportVote implements ReportVote {
  const _$ReportVote(
      {required this.yea,
      this.nayReason,
      this.expertId,
      this.reportId,
      this.report,
      final String? $type})
      : $type = $type ?? 'reportVote';

  factory _$ReportVote.fromJson(Map<String, dynamic> json) =>
      _$$ReportVoteFromJson(json);

  @override
  final bool yea;
  @override
  final String? nayReason;
  @override
  final String? expertId;
  @override
  final String? reportId;
  @override
  final StartupReportModel? report;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'VoteModel.reportVote(yea: $yea, nayReason: $nayReason, expertId: $expertId, reportId: $reportId, report: $report)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportVote &&
            (identical(other.yea, yea) || other.yea == yea) &&
            (identical(other.nayReason, nayReason) ||
                other.nayReason == nayReason) &&
            (identical(other.expertId, expertId) ||
                other.expertId == expertId) &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.report, report) || other.report == report));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, yea, nayReason, expertId, reportId, report);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportVoteCopyWith<_$ReportVote> get copyWith =>
      __$$ReportVoteCopyWithImpl<_$ReportVote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)
        startupVote,
    required TResult Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)
        reportVote,
  }) {
    return reportVote(yea, nayReason, expertId, reportId, report);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)?
        startupVote,
    TResult? Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)?
        reportVote,
  }) {
    return reportVote?.call(yea, nayReason, expertId, reportId, report);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool yea, String? nayReason, String? expertId,
            String? startupId, ShortStartupModel? startup)?
        startupVote,
    TResult Function(bool yea, String? nayReason, String? expertId,
            String? reportId, StartupReportModel? report)?
        reportVote,
    required TResult orElse(),
  }) {
    if (reportVote != null) {
      return reportVote(yea, nayReason, expertId, reportId, report);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartupVote value) startupVote,
    required TResult Function(ReportVote value) reportVote,
  }) {
    return reportVote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartupVote value)? startupVote,
    TResult? Function(ReportVote value)? reportVote,
  }) {
    return reportVote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartupVote value)? startupVote,
    TResult Function(ReportVote value)? reportVote,
    required TResult orElse(),
  }) {
    if (reportVote != null) {
      return reportVote(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportVoteToJson(
      this,
    );
  }
}

abstract class ReportVote implements VoteModel {
  const factory ReportVote(
      {required final bool yea,
      final String? nayReason,
      final String? expertId,
      final String? reportId,
      final StartupReportModel? report}) = _$ReportVote;

  factory ReportVote.fromJson(Map<String, dynamic> json) =
      _$ReportVote.fromJson;

  @override
  bool get yea;
  @override
  String? get nayReason;
  @override
  String? get expertId;
  String? get reportId;
  StartupReportModel? get report;
  @override
  @JsonKey(ignore: true)
  _$$ReportVoteCopyWith<_$ReportVote> get copyWith =>
      throw _privateConstructorUsedError;
}
