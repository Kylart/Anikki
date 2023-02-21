import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

typedef NativeGetAnitomy = Pointer<Void> Function(Pointer<Utf8> str);

typedef NativeDestroyAnitomy = Pointer<Void> Function(Pointer<Void> str);

typedef NativeGetTitle = Pointer<Utf8> Function(Pointer<Void> str);

typedef NativeGetEpisode = Pointer<Utf8> Function(Pointer<Void> str);

typedef NativeGetReleaseGroup = Pointer<Utf8> Function(Pointer<Void> str);

/// Offers a user friendly interface to use the native anitomy library.
/// The C++ code can be found in the `lib` folder or at `https://github.com/erengy/anitomy`.
///
/// ### usage:
/// ```dart
///   final parser = AnitomyParser(inputString: 'FILE_NAME');
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
class AnitomyParser {
  final String inputString;

  late DynamicLibrary library;
  late Pointer<Void> anitomyPtr;

  AnitomyParser({required this.inputString}) {
    // Loads the native library executable
    _getLibrary();

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

  void _getLibrary() {
    // Open the dynamic library
    String libraryPath = 'libanitomy.so';

    if (Platform.isMacOS) {
      libraryPath = 'libanitomy.1.0.0.dylib';
    }

    if (Platform.isWindows) {
      libraryPath = 'anitomy.dll';

      if (Platform.environment.containsKey('FLUTTER_TEST')) {
        libraryPath = path.join(Directory.current.path, 'build', 'windows',
            'anitomy', 'Debug', 'anitomy.dll');
      }
    }

    library = DynamicLibrary.open(libraryPath);
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
}
