import 'package:client/src/constants/dio_provider.dart';
import 'package:client/src/features/profile/data/profile_repository.dart';
import 'package:client/src/features/profile/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) =>
    ProfileRepository(ref.watch(dioProvider));

@riverpod
Future<UserModel> currentUser(CurrentUserRef ref) =>
    ref.watch(profileRepositoryProvider).getCurrentUser();
