import 'package:anikki/components/shared/custom_grid_view.dart';
import 'package:anikki/library/library_list_view.dart';
import 'package:anikki/models/local_file.dart';
import 'package:flutter/material.dart';

class LibraryLayout extends StatelessWidget {
  const LibraryLayout({super.key, required this.layout, required this.entries});

  final String layout;
  final List<LocalFile> entries;

  @override
  Widget build(BuildContext context) {
    return layout == 'grid'
        ? CustomGridView<LocalFile>(entries: entries)
        : UserListLibraryListView(entries: entries);
  }
}
