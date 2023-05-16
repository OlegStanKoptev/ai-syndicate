// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startups_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startupsRepositoryHash() =>
    r'0e25a6328d75320d408a26b801e32e66d533f526';

/// See also [startupsRepository].
@ProviderFor(startupsRepository)
final startupsRepositoryProvider = Provider<StartupsRepository>.internal(
  startupsRepository,
  name: r'startupsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$startupsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StartupsRepositoryRef = ProviderRef<StartupsRepository>;
String _$startupsHash() => r'f2aa56d81ff09af1bd28130ce70a3606db82f9b2';

/// See also [startups].
@ProviderFor(startups)
final startupsProvider = AutoDisposeFutureProvider<List<StartupModel>>.internal(
  startups,
  name: r'startupsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$startupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StartupsRef = AutoDisposeFutureProviderRef<List<StartupModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
