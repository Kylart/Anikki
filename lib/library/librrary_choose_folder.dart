import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/library/store.dart';
import 'package:anikki/providers/user_preferences/local_directory.dart';

class LibraryChooseFolder extends StatelessWidget {
  const LibraryChooseFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final localStore = context.read<LocalStore>();
        final preferences = context.read<LocalDirectory>();
        String? path = await FilePicker.platform.getDirectoryPath();

        if (path == null) return;

        preferences.path = path;
        localStore.files = [];
        localStore.getFiles(path);
      },
      child: const Text('Choose Folder'),
    );
  }
}
