// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'profile',
          factory: $ProfileRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'deposit',
              factory: $DepositRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'new-startup',
              factory: $NewStartupRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'my-startups',
              factory: $MyStartupsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'my-developing-startups',
              factory: $MyDevelopingStartupsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'my-investments',
              factory: $MyInvestmentsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'my-applications',
              factory: $MyApplicationsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'startups-to-verify',
              factory: $StartupsToBeVerifiedRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'notifications',
              factory: $NotificationsRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'auth',
          factory: $AuthRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'login',
              factory: $LoginRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'registration',
              factory: $RegistrationRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'dev-login',
              factory: $DevLoginRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'startups/:startupId',
          factory: $StartupRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'verification',
              factory: $StartupVerificationRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'invest',
              factory: $StartupInvestRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'developer-application',
              factory: $StartupDeveloperApplicationRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'developer-voting',
              factory: $StartupDeveloperVotingRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'developer-report',
              factory: $StartupDeveloperReportRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'report-voting',
              factory: $StartupReportVotingRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $DepositRouteExtension on DepositRoute {
  static DepositRoute _fromState(GoRouterState state) => const DepositRoute();

  String get location => GoRouteData.$location(
        '/profile/deposit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $NewStartupRouteExtension on NewStartupRoute {
  static NewStartupRoute _fromState(GoRouterState state) =>
      const NewStartupRoute();

  String get location => GoRouteData.$location(
        '/profile/new-startup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyStartupsRouteExtension on MyStartupsRoute {
  static MyStartupsRoute _fromState(GoRouterState state) =>
      const MyStartupsRoute();

  String get location => GoRouteData.$location(
        '/profile/my-startups',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyDevelopingStartupsRouteExtension on MyDevelopingStartupsRoute {
  static MyDevelopingStartupsRoute _fromState(GoRouterState state) =>
      const MyDevelopingStartupsRoute();

  String get location => GoRouteData.$location(
        '/profile/my-developing-startups',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyInvestmentsRouteExtension on MyInvestmentsRoute {
  static MyInvestmentsRoute _fromState(GoRouterState state) =>
      const MyInvestmentsRoute();

  String get location => GoRouteData.$location(
        '/profile/my-investments',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyApplicationsRouteExtension on MyApplicationsRoute {
  static MyApplicationsRoute _fromState(GoRouterState state) =>
      const MyApplicationsRoute();

  String get location => GoRouteData.$location(
        '/profile/my-applications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupsToBeVerifiedRouteExtension on StartupsToBeVerifiedRoute {
  static StartupsToBeVerifiedRoute _fromState(GoRouterState state) =>
      const StartupsToBeVerifiedRoute();

  String get location => GoRouteData.$location(
        '/profile/startups-to-verify',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $NotificationsRouteExtension on NotificationsRoute {
  static NotificationsRoute _fromState(GoRouterState state) =>
      const NotificationsRoute();

  String get location => GoRouteData.$location(
        '/profile/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AuthRouteExtension on AuthRoute {
  static AuthRoute _fromState(GoRouterState state) => const AuthRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/auth/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $RegistrationRouteExtension on RegistrationRoute {
  static RegistrationRoute _fromState(GoRouterState state) =>
      const RegistrationRoute();

  String get location => GoRouteData.$location(
        '/auth/registration',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $DevLoginRouteExtension on DevLoginRoute {
  static DevLoginRoute _fromState(GoRouterState state) => const DevLoginRoute();

  String get location => GoRouteData.$location(
        '/auth/dev-login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupRouteExtension on StartupRoute {
  static StartupRoute _fromState(GoRouterState state) => StartupRoute(
        startupId: state.pathParameters['startupId']!,
      );

  String get location => GoRouteData.$location(
        '/startups/${Uri.encodeComponent(startupId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupVerificationRouteExtension on StartupVerificationRoute {
  static StartupVerificationRoute _fromState(GoRouterState state) =>
      StartupVerificationRoute(
        startupId: state.pathParameters['startupId']!,
      );

  String get location => GoRouteData.$location(
        '/startups/${Uri.encodeComponent(startupId)}/verification',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupInvestRouteExtension on StartupInvestRoute {
  static StartupInvestRoute _fromState(GoRouterState state) =>
      StartupInvestRoute(
        startupId: state.pathParameters['startupId']!,
      );

  String get location => GoRouteData.$location(
        '/startups/${Uri.encodeComponent(startupId)}/invest',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupDeveloperApplicationRouteExtension
    on StartupDeveloperApplicationRoute {
  static StartupDeveloperApplicationRoute _fromState(GoRouterState state) =>
      StartupDeveloperApplicationRoute(
        startupId: state.pathParameters['startupId']!,
      );

  String get location => GoRouteData.$location(
        '/startups/${Uri.encodeComponent(startupId)}/developer-application',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupDeveloperVotingRouteExtension on StartupDeveloperVotingRoute {
  static StartupDeveloperVotingRoute _fromState(GoRouterState state) =>
      StartupDeveloperVotingRoute(
        startupId: state.pathParameters['startupId']!,
      );

  String get location => GoRouteData.$location(
        '/startups/${Uri.encodeComponent(startupId)}/developer-voting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupDeveloperReportRouteExtension on StartupDeveloperReportRoute {
  static StartupDeveloperReportRoute _fromState(GoRouterState state) =>
      StartupDeveloperReportRoute(
        startupId: state.pathParameters['startupId']!,
      );

  String get location => GoRouteData.$location(
        '/startups/${Uri.encodeComponent(startupId)}/developer-report',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StartupReportVotingRouteExtension on StartupReportVotingRoute {
  static StartupReportVotingRoute _fromState(GoRouterState state) =>
      StartupReportVotingRoute(
        startupId: state.pathParameters['startupId']!,
      );

  String get location => GoRouteData.$location(
        '/startups/${Uri.encodeComponent(startupId)}/report-voting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
