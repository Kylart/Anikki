import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;

typedef NativeGetAnitomy = Pointer<Void> Function(Pointer<Utf8> str);

typedef NativeDestroyAnitomy = Pointer<Void> Function(Pointer<Void> str);

typedef NativeGetTitle = Pointer<Utf8> Function(Pointer<Void> str);

typedef NativeGetEpisode = Pointer<Utf8> Function(Pointer<Void> str);

typedef NativeGetReleaseGroup = Pointer<Utf8> Function(Pointer<Void> str);

class AnitomyParser {
  final String inputString;

  late DynamicLibrary library;
  late Pointer<Void> anitomyPtr;

  AnitomyParser({ required this.inputString }) {
    _getLibrary();

    final NativeGetAnitomy getAnitomy = library
      .lookup<NativeFunction<NativeGetAnitomy>>('get_anitomy')
      .asFunction();

    anitomyPtr = getAnitomy(inputString.toNativeUtf8());
  }

  void dispose () {
    final NativeDestroyAnitomy destroyAnitomy = library
      .lookup<NativeFunction<NativeDestroyAnitomy>>('destroy_anitomy')
      .asFunction();

    destroyAnitomy(anitomyPtr);
  }

  void _getLibrary () {
    // Open the dynamic library
    String libraryPath = 'libanitomy.so';

    if (Platform.isMacOS) {
      libraryPath ='libanitomy.1.0.0.dylib';
    }

    if (Platform.isWindows) {
      libraryPath = 'anitomy.dll';

      if (Platform.environment.containsKey('FLUTTER_TEST')) {
        libraryPath = path.join(Directory.current.path, 'build', 'windows', 'anitomy', 'Debug', 'anitomy.dll');
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