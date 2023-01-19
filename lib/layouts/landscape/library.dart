import 'package:flutter/material.dart';
import 'package:kawanime/components/shared/custom_grid_view.dart';
import 'package:kawanime/components/user_list/user_list_library_list_view.dart';
import 'package:kawanime/providers/local/local.dart';
import 'package:provider/provider.dart';

class Library extends StatefulWidget {
  const Library({super.key, required this.layout});

  final String layout;

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    final entries = context.watch<LocalStore>().currentFiles;
    final isLoading = context.watch<LocalStore>().isLoading;
    final layout = widget.layout;

    if (entries.isNotEmpty) {
      if (layout == 'list') {
        return Expanded(
          child: UserListLibraryListView(
            entries: context.watch<LocalStore>().currentFiles,
          ),
        );
      }

      if (layout == 'grid') {
        return Expanded(
          child: CustomGridView(
            type: GridViewType.local,
            entries: context.watch<LocalStore>().currentFiles,
          ),
        );
      }
    }

    if (isLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Center(
      child: Expanded(
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.error,
          title: const Text('Error'),
          subtitle: const Text('Something wrong just happened...'),
        ),
      ),
    );
  }
}
