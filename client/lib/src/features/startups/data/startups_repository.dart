import 'package:client/src/constants/dio_provider.dart';
import 'package:client/src/features/startups/domain/startup_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'startups_repository.g.dart';

class StartupsRepository {
  StartupsRepository(this.client);
  final Dio client;

  Future<List<StartupModel>> getStartups() {
    return client.get('api/startups').then((value) =>
        (value.data as List).map((e) => StartupModel.fromJson(e)).toList());
  }
}

@Riverpod(keepAlive: true)
StartupsRepository startupsRepository(StartupsRepositoryRef ref) =>
    StartupsRepository(ref.watch(dioProvider));

@riverpod
Future<List<StartupModel>> startups(StartupsRef ref) =>
    ref.watch(startupsRepositoryProvider).getStartups();
