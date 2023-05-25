import 'package:client/src/constants/client.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/new_startup_model.dart';
import 'package:client/src/features/startups/domain/queries/search_startup_query.dart';
import 'package:client/src/features/startups/domain/responses/new_startup_response.dart';
import 'package:client/src/features/startups/domain/responses/search_startup_response.dart';

class StartupService {
  Future<SearchStartupResponse> searchStartups({SearchStartupsQuery? query}) =>
      dio
          .get(Uri(
            path: '/api/startup/search',
            queryParameters: query?.toJson(),
          ).toString())
          .then((response) => SearchStartupResponse.fromJson(response.data));

  Future<FullStartupModel> getStartup({required String id}) => dio
      .get('/api/startup/$id')
      .then((response) => FullStartupModel.fromJson(response.data));

  Future<NewStartupResponse> createNewStartup(
          {required NewStartupModel newStartup}) =>
      dio
          .post('/api/stratup/new', data: newStartup.toJson())
          .then((response) => NewStartupResponse.fromJson(response.data));
}
