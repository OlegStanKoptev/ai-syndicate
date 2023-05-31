import 'package:client/src/constants/client.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/new_startup_model.dart';
import 'package:client/src/features/startups/domain/models/verification_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/verification_model.dart';
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
          .post('/api/startup/new', data: newStartup.toJson())
          .then((response) => NewStartupResponse.fromJson(response.data));

  Future verifyStartup({
    required String id,
    required VerificationModel vote,
  }) =>
      dio.post(
        '/api/startup/$id/verification/vote',
        data: vote.toJson(),
      );

  Future confirmStartup({
    required String id,
    required VerificationConfirmModel confirm,
  }) =>
      dio.post(
        '/api/startup/$id/verification_succeded/confirm',
        data: confirm.toJson(),
      );

  Future investInStartup({
    required String id,
    required int amount,
  }) =>
      dio.post(
        '/api/startup/$id/financing/invest',
        data: {"amount": amount},
      );

  Future confirmFinancingStartup({
    required String id,
  }) =>
      dio.post(
        '/api/startup/$id/financing_succeded/confirm',
        data: {
          "developerApplicationDeadline": DateTime.now().add(
            const Duration(days: 7),
          )
        },
      );

  Future applyForDevelopment({
    required String id,
    required String message,
  }) =>
      dio.post(
        '/api/startup/$id/developer-application/new',
        data: {"message": message},
      );

  Future confirmDeveloperForStartup({
    required String id,
  }) =>
      dio.post(
        '/api/startup/$id/developer-application/new',
        data: {
          "developerVotingDeadline": DateTime.now().add(
            const Duration(days: 7),
          )
        },
      );

  Future voteForDeveloper({
    required String id,
    required String applicationDeveloperId,
  }) =>
      dio.post(
        '/api/startup/$id/developer-voting/vote',
        data: {"applicationDeveloperId": applicationDeveloperId},
      );
}
