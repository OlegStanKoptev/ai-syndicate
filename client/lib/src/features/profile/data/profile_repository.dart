import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:dio/dio.dart';

class ProfileRepository {
  ProfileRepository(this.client);
  final Dio client;

  Future<UserModel> getCurrentUser() {
    return client
        .get('/api/user/me')
        .then((value) => UserModel.fromJson(value.data));
  }
}
