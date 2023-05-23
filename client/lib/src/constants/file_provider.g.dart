// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileModel _$$_FileModelFromJson(Map<String, dynamic> json) => _$_FileModel(
      json['file'] as String,
    );

Map<String, dynamic> _$$_FileModelToJson(_$_FileModel instance) =>
    <String, dynamic>{
      'file': instance.file,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileRepositoryHash() => r'd6684f91482e9fc5e8fab60eedbc9e3119c112c1';

/// See also [fileRepository].
@ProviderFor(fileRepository)
final fileRepositoryProvider = Provider<FileRepository>.internal(
  fileRepository,
  name: r'fileRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fileRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FileRepositoryRef = ProviderRef<FileRepository>;
String _$fileUrlHash() => r'6b12c199e615ad90d7152c62ebee7e262ba00c12';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FileUrlRef = AutoDisposeProviderRef<String>;

/// See also [fileUrl].
@ProviderFor(fileUrl)
const fileUrlProvider = FileUrlFamily();

/// See also [fileUrl].
class FileUrlFamily extends Family<String> {
  /// See also [fileUrl].
  const FileUrlFamily();

  /// See also [fileUrl].
  FileUrlProvider call({
    required String fileName,
  }) {
    return FileUrlProvider(
      fileName: fileName,
    );
  }

  @override
  FileUrlProvider getProviderOverride(
    covariant FileUrlProvider provider,
  ) {
    return call(
      fileName: provider.fileName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fileUrlProvider';
}

/// See also [fileUrl].
class FileUrlProvider extends AutoDisposeProvider<String> {
  /// See also [fileUrl].
  FileUrlProvider({
    required this.fileName,
  }) : super.internal(
          (ref) => fileUrl(
            ref,
            fileName: fileName,
          ),
          from: fileUrlProvider,
          name: r'fileUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fileUrlHash,
          dependencies: FileUrlFamily._dependencies,
          allTransitiveDependencies: FileUrlFamily._allTransitiveDependencies,
        );

  final String fileName;

  @override
  bool operator ==(Object other) {
    return other is FileUrlProvider && other.fileName == fileName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fileName.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
