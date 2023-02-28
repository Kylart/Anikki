import 'package:flutter/material.dart';

import 'package:anikki/library/library_layout.dart';
import 'package:anikki/library/store.dart';
import 'package:provider/provider.dart';

class Library extends StatelessWidget {
  const Library({
    super.key,
    required this.layout,
    required this.path,
  });

  final String layout;
  final String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<LocalStore>().getFiles(path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
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
          return Expanded(
            child: LibraryLayout(
              layout: layout,
              entries: entries,
            ),
          );
        }
      },
    );
  }
}
