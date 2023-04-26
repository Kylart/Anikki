import 'dart:io';

import 'package:anikki/video_player/view/anikki_video_player.dart';
import 'package:anilist/anilist.dart';
import 'package:anitomy/anitomy.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path/path.dart';

import 'package:anikki/models/library_entry.dart';
import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/widgets/fade_overlay.dart';
import 'package:anikki/helpers/anilist/anilist_client.dart';
import 'package:anikki/helpers/errors/library_directory_does_not_exist_exception.dart';
import 'package:anikki/helpers/logger.dart';
import 'package:anikki/library/bloc/library_bloc.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';

part 'files.dart';
part 'folder.dart';
part 'anilist.dart';
