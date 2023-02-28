import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/shared/custom_grid_view.dart';
import 'package:anikki/library/library_list_view.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/providers/user_list_layout.dart';

class LibraryLayout extends StatelessWidget {
  const LibraryLayout({super.key, required this.entries});

  final List<LocalFile> entries;

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<UserListLayoutStore>().layout;

    return layout == UserListLayouts.grid
        ? CustomGridView<LocalFile>(entries: entries)
        : UserListLibraryListView(entries: entries);
  }
}
