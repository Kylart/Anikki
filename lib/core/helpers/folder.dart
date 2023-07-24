import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_app_file/open_app_file.dart';

import 'package:anikki/app/settings/bloc/settings_bloc.dart';

Future<void> openFolderInExplorer(BuildContext context) async {
  final path =
      BlocProvider.of<SettingsBloc>(context).state.settings.localDirectory;

  OpenAppFile.open(path);
}
