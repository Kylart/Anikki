import 'dart:io';

import 'package:anikki/helpers/anilist/anilist.dart';
import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path/path.dart';

import 'package:anikki/features/video_player/view/anikki_video_player.dart';
import 'package:anikki/models/library_entry.dart';
import 'package:anikki/widgets/fade_overlay.dart';
import 'package:anikki/helpers/anilist/anilist_client.dart';
import 'package:anikki/helpers/errors/library_directory_does_not_exist_exception.dart';
import 'package:anikki/helpers/logger.dart';
import 'package:anikki/features/library/bloc/library_bloc.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/features/settings/bloc/settings_bloc.dart';

part 'files.dart';
part 'folder.dart';

///
/// [LibraryRepository] should only be used by the [LibraryBloc] class.
/// Its main objective is to be able to be mocked during testing phases.
///
class LibraryRepository {
  const LibraryRepository();

  Future<List<LocalFile>> retrieveFilesFromPath(String path) async {
    return _retrieveFilesFromPath(path: path);
  }

  Future<LocalFile> getFile(String path) async {
    return LocalFile.createAndSearchMedia(path);
  }
}
