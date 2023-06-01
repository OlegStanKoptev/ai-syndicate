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

  Future updateCurrentUser() => dio
      .get('/api/user/me')
      .then((response) => UserModel.fromJson(response.data))
      .then((user) => _updateUserAndNotify(user));

  Future logout() =>
      dio.post('/api/user/logout').then((_) => _updateUserAndNotify(null));

  Future placeDeposit({required int amount}) => dio
      .post('/api/user/deposit', data: {"amount": amount})
      .then((response) => DepositResponse.fromJson(response.data).balance)
      .then(
        (balance) {
          final currentUser = _currentUser;
          if (currentUser != null) {
            final UserModel updatedCurrentUser = switch (currentUser) {
              // ignore: unused_result
              User() => currentUser.copyWith(balance: balance),
              _ => currentUser,
            };
            _updateUserAndNotify(updatedCurrentUser);
          }
        },
      );
}
