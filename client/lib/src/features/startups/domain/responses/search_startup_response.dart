import 'package:client/src/features/startups/domain/models/short_startup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_startup_response.freezed.dart';
part 'search_startup_response.g.dart';

@freezed
class SearchStartupResponse with _$SearchStartupResponse {
  factory SearchStartupResponse({
    required int size,
    required int page,
    required int total,
    required int totalPages,
    required int from,
    required int to,
    required List<ShortStartupModel> data,
    String? logoFile,
  }) = _SearchStartupResponse;

  factory SearchStartupResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchStartupResponseFromJson(json);
}
