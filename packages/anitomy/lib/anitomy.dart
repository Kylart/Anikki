import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as p;

typedef NativeGetAnitomy = Pointer<Void> Function(Pointer<Utf8> str);

typedef NativeDestroyAnitomy = Pointer<Void> Function(Pointer<Void> str);

typedef NativeGetTitle = Pointer<Utf8> Function(Pointer<Void> str);

typedef NativeGetEpisode = Pointer<Utf8> Function(Pointer<Void> str);

typedef NativeGetReleaseGroup = Pointer<Utf8> Function(Pointer<Void> str);

typedef NativeGetSeason = Pointer<Utf8> Function(Pointer<Void> str);

/// Offers a user friendly interface to use the native anitomy library.
/// The C++ code can be found in the `lib` folder or at `https://github.com/erengy/anitomy`.
///
/// ### usage:
/// ```dart
///   final parser = Anitomy(inputString: 'FILE_NAME');
///
///   print(parser.title);
///   print(parser.episode);
///   print(parser.releaseGroup);
/// ```
///
/// ### Technical details:
/// This is using the ffi library to bind C code to dart.
/// 1. Creation time. Create an anitomy instance that parses the input.
/// 2. Store the anitomy instance memory address
/// 3. For every property it calls `get_property` with the anitomy instance address.
///   C++ code will use that address to find the anitomy instance.
/// 4. Find the given property with the anitomy instance and returns it.
class Anitomy {
  final String inputString;
  final String _libName = 'anitomy';

  late DynamicLibrary library;
  late Pointer<Void> anitomyPtr;

  Anitomy({required this.inputString}) {
    // Loads the native library executable
    library = _getLibrary();

    final NativeGetAnitomy getAnitomy = library
        .lookup<NativeFunction<NativeGetAnitomy>>('get_anitomy')
        .asFunction();

    anitomyPtr = getAnitomy(inputString.toNativeUtf8());
  }

  void dispose() {
    final NativeDestroyAnitomy destroyAnitomy = library
        .lookup<NativeFunction<NativeDestroyAnitomy>>('destroy_anitomy')
        .asFunction();

    destroyAnitomy(anitomyPtr);
  }

  DynamicLibrary _getLibrary() {
    final isTest = Platform.environment.containsKey('FLUTTER_TEST');

    if (Platform.isMacOS || Platform.isIOS) {
      if (isTest) {
        return DynamicLibrary.open('build/macos/Build/Products/Debug'
            '/$_libName/$_libName.framework/$_libName');
      }

      return DynamicLibrary.open('$_libName.framework/$_libName');
    }
    if (Platform.isAndroid || Platform.isLinux) {
      if (isTest) {
        return DynamicLibrary.open(
            'build/linux/x64/debug/bundle/lib/lib$_libName.so');
      }

      return DynamicLibrary.open('lib$_libName.so');
    }
    if (Platform.isWindows) {
      late final String arch;
      final winArch = Platform.environment['PROCESSOR_ARCHITECTURE'];

      if (winArch == 'ARM64') {
        arch = 'arm64';
      } else {
        arch = 'x64';
      }

      if (isTest) {
        return DynamicLibrary.open(p.canonicalize(
            p.join(r'build\windows', arch, r'runner\Debug', '$_libName.dll')));
      }

      return DynamicLibrary.open('$_libName.dll');
    }
    throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  }

  String? get title {
    final NativeGetTitle getTitle = library
        .lookup<NativeFunction<NativeGetTitle>>('get_title')
        .asFunction();

    final title = getTitle(anitomyPtr).toDartString();

    return title.isEmpty ? null : title;
  }

  String? get episode {
    final NativeGetEpisode getEpisode = library
        .lookup<NativeFunction<NativeGetEpisode>>('get_episode')
        .asFunction();

    final episode = getEpisode(anitomyPtr).toDartString();

    return episode.isEmpty ? null : episode;
  }

  String? get releaseGroup {
    final NativeGetReleaseGroup getReleaseGroup = library
        .lookup<NativeFunction<NativeGetReleaseGroup>>('get_release_group')
        .asFunction();

    final releaseGroup = getReleaseGroup(anitomyPtr).toDartString();

    return releaseGroup.isEmpty ? null : releaseGroup;
  }

  int? get season {
    final NativeGetSeason getSeason = library
        .lookup<NativeFunction<NativeGetSeason>>('get_season')
        .asFunction();

    final season = getSeason(anitomyPtr).toDartString();

    return season.isEmpty ? null : int.tryParse(season);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'releaseGroup': releaseGroup,
      'title': title,
      'episode': episode,
      'season': season,
    };
  }
}
