import 'package:client/src/features/authentication/presentation/screens/auth_screen/auth_screen.dart';
import 'package:client/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:client/src/features/authentication/presentation/screens/register_screen/register_screen.dart';
import 'package:client/src/features/startups/presentation/startups_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
// ignore: unsupported_provider_value
GoRouter goRouter(GoRouterRef ref) => GoRouter(routes: _routes);

final _routes = [
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => const StartupsScreen(),
    routes: [
      GoRoute(
        name: 'profile',
        path: 'profile',
        builder: (context, state) => const AuthScreen(),
        routes: [
          GoRoute(
            name: 'login',
            path: 'login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            name: 'register',
            path: 'register',
            builder: (context, state) => const RegisterScreen(),
          ),
        ],
      ),
    ],
  ),
];
