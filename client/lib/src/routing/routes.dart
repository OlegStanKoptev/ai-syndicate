import 'dart:async';

import 'package:client/src/features/authentication/presentation/auth_screen.dart';
import 'package:client/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:client/src/features/authentication/presentation/screens/registration_screen.dart';
import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/profile/presentation/my_investments_screen.dart';
import 'package:client/src/features/profile/presentation/my_startups_screen.dart';
import 'package:client/src/features/profile/presentation/notifications_screen.dart';
import 'package:client/src/features/profile/presentation/profile_screen.dart';
import 'package:client/src/features/startups/presentation/screens/new_startup_screen.dart';
import 'package:client/src/features/startups/presentation/screens/startup_developer_application.dart';
import 'package:client/src/features/startups/presentation/screens/startup_developer_voting.dart';
import 'package:client/src/features/startups/presentation/screens/startup_invest_screen.dart';
import 'package:client/src/features/startups/presentation/screens/startup_screen.dart';
import 'package:client/src/features/startups/presentation/screens/startup_verification_screen.dart';
import 'package:client/src/features/startups/presentation/startups_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'routes.g.dart';

final router =
    GoRouter(routes: $appRoutes, initialLocation: const HomeRoute().location);

FutureOr<String?> authenticationRequired(BuildContext context) =>
    Provider.of<ProfileService>(context, listen: false).currentUser == null
        ? const AuthRoute().location
        : null;

@TypedGoRoute<HomeRoute>(path: '/', routes: [
  TypedGoRoute<ProfileRoute>(path: 'profile', routes: [
    TypedGoRoute<NewStartupRoute>(path: 'new-startup'),
    TypedGoRoute<MyStartupsRoute>(path: 'my-startups'),
    TypedGoRoute<MyInvestmentsRoute>(path: 'my-investments'),
    TypedGoRoute<NotificationsRoute>(path: 'notifications'),
  ]),
  TypedGoRoute<AuthRoute>(path: 'auth', routes: [
    TypedGoRoute<LoginRoute>(path: 'login'),
    TypedGoRoute<RegistrationRoute>(path: 'registration'),
  ]),
  TypedGoRoute<StartupRoute>(path: 'startups/:startupId', routes: [
    TypedGoRoute<StartupVerificationRoute>(path: 'verification'),
    TypedGoRoute<StartupInvestRoute>(path: 'invest'),
    TypedGoRoute<StartupDeveloperApplicationRoute>(
      path: 'developer-application',
    ),
    TypedGoRoute<StartupDeveloperVotingRoute>(
      path: 'developer-voting',
    ),
  ]),
])
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StartupsScreen();
}

@immutable
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileScreen();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class NotificationsRoute extends GoRouteData {
  const NotificationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotificationsScreen();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class AuthRoute extends GoRouteData {
  const AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthScreen();
}

@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}

@immutable
class RegistrationRoute extends GoRouteData {
  const RegistrationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const RegistrationScreen();
}

@immutable
class StartupRoute extends GoRouteData {
  const StartupRoute({required this.startupId});
  final String startupId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      StartupScreen(startupId: startupId);
}

@immutable
class NewStartupRoute extends GoRouteData {
  const NewStartupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NewStartupScreen();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class MyStartupsRoute extends GoRouteData {
  const MyStartupsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyStartupsScreen();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class MyInvestmentsRoute extends GoRouteData {
  const MyInvestmentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyInvestmentsScreen();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class StartupVerificationRoute extends GoRouteData {
  const StartupVerificationRoute({required this.startupId});
  final String startupId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      StartupVerificationScreen(startupId: startupId);

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class StartupInvestRoute extends GoRouteData {
  const StartupInvestRoute({required this.startupId});
  final String startupId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      StartupInvestScreen(startupId: startupId);

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class StartupDeveloperApplicationRoute extends GoRouteData {
  const StartupDeveloperApplicationRoute({required this.startupId});
  final String startupId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      StartupDeveloperApplicationScreen(startupId: startupId);

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}

@immutable
class StartupDeveloperVotingRoute extends GoRouteData {
  const StartupDeveloperVotingRoute({required this.startupId});
  final String startupId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      StartupDeveloperVotingScreen(startupId: startupId);

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      authenticationRequired(context);
}
