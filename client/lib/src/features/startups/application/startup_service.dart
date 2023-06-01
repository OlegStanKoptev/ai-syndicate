import 'package:client/src/constants/client.dart';
import 'package:client/src/features/startups/domain/models/developer_application_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/developer_application_model.dart';
import 'package:client/src/features/startups/domain/models/developer_voting_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/financing_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/full_startup_model.dart';
import 'package:client/src/features/startups/domain/models/new_startup_model.dart';
import 'package:client/src/features/startups/domain/models/verification_confirm_model.dart';
import 'package:client/src/features/startups/domain/models/vote_model.dart';
import 'package:client/src/features/startups/domain/queries/search_startup_query.dart';
import 'package:client/src/features/startups/domain/responses/new_startup_response.dart';
import 'package:client/src/features/startups/domain/responses/search_startup_response.dart';
import 'package:dio/dio.dart';

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

  Future<Response> verificationVote({
    required String id,
    required StartupVote vote,
  }) =>
      dio.post(
        '/api/startup/$id/verification/vote',
        data: vote.toJson(),
      );

  Future<Response> verificationSuccessConfirm({
    required String id,
    required VerificationConfirmModel confirm,
  }) =>
      dio.post(
        '/api/startup/$id/verification_succeded/confirm',
        data: confirm.toJson(),
      );

  Future<Response> financingInvest({
    required String id,
    required int amount,
  }) =>
      dio.post(
        '/api/startup/$id/financing/invest',
        data: {"amount": amount},
      );

  Future<Response> financingSuccessConfirm({
    required String id,
    required FinancingConfirmModel confirmModel,
  }) =>
      dio.post(
        '/api/startup/$id/financing_succeded/confirm',
        data: confirmModel.toJson(),
      );

  Future<Response> developerApplicationNew({
    required String id,
    required String message,
  }) =>
      dio.post(
        '/api/startup/$id/developer-application/new',
        data: {"message": message},
      );

  Future<Response> developerApplicationSuccessConfirm({
    required String id,
    required DeveloperApplicationConfirmModel confirmModel,
  }) =>
      dio.post(
        '/api/startup/$id/developer-application_succeded/confirm',
        data: confirmModel.toJson(),
      );

  Future<Iterable<DeveloperApplicationModel>> developerApplications({
    required String id,
  }) =>
      dio
          .get('/api/startup/$id/developer-application/list')
          .then((response) => response.data as List)
          .then(
            (list) => list.map((e) => DeveloperApplicationModel.fromJson(e)),
          );

  Future<Response> developerVotingVote({
    required String id,
    required String applicationDeveloperId,
  }) =>
      dio.post(
        '/api/startup/$id/developer-voting/vote',
        data: {"applicationDeveloperId": applicationDeveloperId},
      );

  Future<Response> developerVotingLeaders({
    required String id,
  }) =>
      dio.get(
        '/api/startup/$id/developer-voting_succeded/leaders',
      );

  Future<Response> developerVotingSuccessConfirm({
    required String id,
    required DeveloperVotingConfirmModel confirmModel,
  }) =>
      dio.post(
        '/api/startup/$id/developer-voting_succeded/confirm',
        data: confirmModel.toJson(),
      );

  Future<Response> developmentReport({
    required String id,
    required String reportFileId,
  }) =>
      dio.post(
        '/api/startup/$id/development/report',
        data: {"reportFile": reportFileId},
      );

  Future<Response> developmentReportVote({
    required String id,
    required VoteModel vote,
  }) =>
      dio.post(
        '/api/startup/$id/development/vote',
        data: vote.toJson(),
      );

  Future<Response> developmentSuccessConfirm({
    required String id,
  }) =>
      dio.post('/api/startup/$id/development_succeded/confirm');
}
