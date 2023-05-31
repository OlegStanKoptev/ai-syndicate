import 'package:client/src/constants/client.dart';
import 'package:client/src/features/profile/domain/deposit_response.dart';
import 'package:client/src/features/profile/domain/investment.dart';
import 'package:client/src/features/profile/domain/investments_response.dart';
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

  Future placeDeposit() => dio
          .post('/api/user/deposit')
          .then((response) => DepositResponse.fromJson(response.data).balance)
          .then(
        (balance) {
          final currentUser = _currentUser;
          if (currentUser != null) {
            final UserModel updatedCurrentUser = switch (currentUser) {
              User() => currentUser.copyWith(balance: balance),
              _ => currentUser,
            };
            _updateUserAndNotify(updatedCurrentUser);
          }
        },
      );

  Future<InvestmentsResponse> getInvestments() => Future.delayed(
        const Duration(seconds: 1),
        () => InvestmentsResponse(
          investments: [
            Investment(
              startupId: "cli8ugyyw035ps30irrzv5c08",
              amount: 100,
              date: DateTime.now(),
            )
          ],
        ),
      );
}
