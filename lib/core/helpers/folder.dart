import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:open_file/open_file.dart';

Future<void> openFolderInExplorer(BuildContext context) async {
  final path = BlocProvider.of<SettingsBloc>(context)
      .state
      .settings
      .librarySettings
      .path;

  OpenFile.open(path);
}
