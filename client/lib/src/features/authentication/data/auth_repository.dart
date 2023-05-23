import 'package:client/src/features/authentication/domain/new_developer_model.dart';
import 'package:client/src/features/authentication/domain/new_user_model.dart';
import 'package:client/src/features/profile/application/profile_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepository {
  AuthRepository(this.client);
  final Dio client;

  Future login({
    required WidgetRef ref,
    required String email,
    required String password,
  }) {
    return client.post(
      '/api/user/login',
      data: {
        'email': email,
        'password': password,
      },
    ).whenComplete(() => ref.refresh(currentUserProvider));
  }

  Future joinAsUser({required NewUserModel user}) {
    return client.post(
      '/api/user/join',
      data: user.toJson(),
    );
  }

  Future joinAsDeveloper({required NewDeveloperModel developer}) {
    return client.post(
      '/api/user/developer/apply',
      data: developer.toJson(),
    );
  }

  Future logout(WidgetRef ref) {
    return client
        .post('/api/user/logout')
        .whenComplete(() => ref.refresh(currentUserProvider));
  }
}
