import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/shared/custom_grid_view.dart';
import 'package:anikki/components/user_list/library/library_list_view.dart';
import 'package:anikki/providers/local/local.dart';
import 'package:anikki/providers/local/types/file.dart';

class Library extends StatefulWidget {
  const Library({super.key, required this.layout});

  final String layout;

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<LocalStore>();
    final entries = store.currentFiles;
    final isLoading = store.isLoading;
    final layout = widget.layout;

    if (isLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (entries.isNotEmpty) {
      if (layout == 'list') {
        return Expanded(
          child: UserListLibraryListView(
            entries: store.currentFiles,
          ),
        );
      }

      if (layout == 'grid') {
        return Expanded(
          child: CustomGridView<LocalFile>(
            entries: store.currentFiles,
          ),
        );
      }
    }

    return ListTile(
      tileColor: Theme.of(context).colorScheme.error,
      title: const Text('Error'),
      subtitle: const Text('Something wrong just happened...'),
    );
  }
}
