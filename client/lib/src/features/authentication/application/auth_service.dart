import 'package:client/src/constants/client.dart';
import 'package:client/src/features/authentication/domain/new_developer_model.dart';
import 'package:client/src/features/authentication/domain/new_user_model.dart';
import 'package:client/src/features/profile/application/profile_service.dart';

class AuthService {
  final ProfileService profileService;
  AuthService({required this.profileService});

  Future login({
    required String email,
    required String password,
  }) {
    return dio.post(
      '/api/user/login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((response) {
      if (response.statusCode == 200) {
        return profileService.updateCurrentUser();
      } else {
        throw Exception('Failed to login');
      }
    });
  }

  Future joinAsUser({required NewUserModel user}) {
    return dio.post(
      '/api/user/join',
      data: user.toJson(),
    );
  }

  Future joinAsDeveloper({required NewDeveloperModel developer}) {
    return dio.post(
      '/api/user/developer/apply',
      data: developer.toJson(),
    );
  }
}
