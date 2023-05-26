import 'package:client/src/constants/client.dart';
import 'package:client/src/features/profile/domain/deposit_response.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:flutter/material.dart';

class ProfileService extends ChangeNotifier {
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  void _updateUserAndNotify(UserModel? user) {
    _currentUser = user;
    notifyListeners();
  }

  Future updateCurrentUser() {
    return dio
        .get('/api/user/me')
        .then((response) => UserModel.fromJson(response.data))
        .then((user) => _updateUserAndNotify(user));
  }

  Future logout() {
    return dio.post('/api/user/logout').then((_) => _updateUserAndNotify(null));
  }

  Future deposit() {
    return dio
        .post('/api/user/deposit')
        .then((response) => DepositResponse.fromJson(response.data).balance)
        .then(
          // TODO: Add balance
          (balance) => _updateUserAndNotify(_currentUser?.copyWith()),
        );
  }
}
