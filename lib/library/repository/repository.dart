import 'dart:io';

import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/components/fade_overlay.dart';
import 'package:anikki/components/video_player/desktop_player.dart';
import 'package:anikki/components/video_player/mobile_player.dart';
import 'package:anikki/components/video_player/video_player.dart';
import 'package:anikki/helpers/anilist_client.dart';
import 'package:anikki/helpers/desktop_hooks.dart';
import 'package:anikki/helpers/errors/library_directory_does_not_exist_exception.dart';
import 'package:anikki/library/bloc/library_bloc.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/settings/bloc/settings_bloc.dart';
import 'package:anikki/watch_list/bloc/watch_list_bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:anilist/anilist.dart';
import 'package:anitomy/anitomy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path/path.dart';
import 'package:wakelock/wakelock.dart';

part 'files.dart';
part 'folder.dart';
part 'anilist.dart';
