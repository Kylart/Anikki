import 'package:anikki/helpers/errors/library_empty_directory_exception.dart';
import 'package:anikki/providers/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

import 'package:anikki/library/library_layout.dart';
import 'package:anikki/library/store.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  const Library({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final path = context.watch<LocalDirectory>().path;

    return FutureBuilder(
      future: context.read<LocalStore>().getFiles(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          if (snapshot.error!.runtimeType == LibraryEmptyDirectoryException) {
            final error = snapshot.error! as LibraryEmptyDirectoryException;

            return ListTile(
              tileColor: Theme.of(context).colorScheme.error,
              title: Text(error.cause),
            );
          }
          return ListTile(
            tileColor: Theme.of(context).colorScheme.error,
            title: const Text('Error'),
            subtitle: Text(snapshot.error!.toString()),
          );
        }

        final entries = snapshot.data;

        if (entries!.isEmpty) {
          return const ListTile(
            title: Text('No File'),
            subtitle: Text('Saddge'),
          );
        } else {
          return const LibraryLayout();
        }
      },
    );
  }
}
