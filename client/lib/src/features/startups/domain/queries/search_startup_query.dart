import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_startup_query.freezed.dart';
part 'search_startup_query.g.dart';

@freezed
class SearchStartupsQuery with _$SearchStartupsQuery {
  @JsonSerializable(includeIfNull: false)
  factory SearchStartupsQuery({
    int? page,
    int? size,
    StartupStatus? status,
    String? startuperId,
  }) = _SearchStartupsQuery;

  factory SearchStartupsQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchStartupsQueryFromJson(json);
}
