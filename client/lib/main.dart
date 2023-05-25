import 'package:client/src/constants/services/file_service.dart';
import 'package:client/src/features/authentication/application/auth_service.dart';
import 'package:client/src/features/profile/application/profile_service.dart';
import 'package:client/src/features/startups/application/startup_service.dart';
import 'package:client/src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider<FileService>(
            create: (_) => FileService(),
          ),
          ChangeNotifierProvider<ProfileService>(
            create: (_) => ProfileService(),
          ),
          ProxyProvider<ProfileService, AuthService>(
            update: (_, profileService, __) =>
                AuthService(profileService: profileService),
          ),
          Provider(
            create: (_) => StartupService(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
