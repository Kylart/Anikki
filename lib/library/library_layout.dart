import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/custom_grid_view.dart';
import 'package:anikki/library/library_list_view.dart';
import 'package:anikki/library/store.dart';
import 'package:anikki/models/local_file.dart';
import 'package:anikki/providers/user_preferences/user_list_layout.dart';
import 'package:anikki/user_list/user_list_grid_delegate.dart';

class LibraryLayout extends StatelessWidget {
  const LibraryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.watch<UserListLayout>().layout;
    final entries = context.watch<LocalStore>().files;

    return layout == UserListLayouts.grid
        ? CustomGridView<LocalFile>(
            entries: entries,
            gridDelegate: userListGridDelegate,
          )
        : UserListLibraryListView(entries: entries);
  }
}
