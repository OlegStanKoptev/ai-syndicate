import 'dart:convert';

import 'package:client/src/constants/dio_provider.dart';
import 'package:client/src/features/authentication/domain/user_model.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this.client);
  final Dio client;

  Future login(
    WidgetRef ref, {
    required String email,
    required String password,
  }) {
    return client
        .post('api/user/login',
            data: jsonEncode({'email': email, 'password': password}))
        .whenComplete(() => ref.refresh(currentUserProvider));
  }

  Future logout(WidgetRef ref) {
    return client
        .post('api/user/logout')
        .whenComplete(() => ref.refresh(currentUserProvider));
  }

  Future<UserModel> getCurrentUser() {
    return client
        .get('api/user/me')
        .then((value) => UserModel.fromJson(value.data));
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(ref.watch(dioProvider));

@riverpod
Future<UserModel> currentUser(CurrentUserRef ref) =>
    ref.watch(authRepositoryProvider).getCurrentUser();
