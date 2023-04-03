import 'package:empty_widget/empty_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:anikki/library/bloc/library_bloc.dart';
import 'package:anikki/helpers/loader.dart';
import 'package:anikki/components/error_tile.dart';
import 'package:anikki/library/view/library_layout.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<LibraryBloc>(context, listen: true).state;

    switch (state.runtimeType) {
      case LibraryLoading:
        return const Loader();

      case LibraryError:
        return ErrorTile(
          title: 'Could not load your files at ${state.path}',
          description: (state as LibraryError).message,
        );

      case LibraryEmpty:
        return Center(
          child: EmptyWidget(
            packageImage: PackageImage.Image_2,
            title: 'No File',
            subTitle: 'Could not find any video.',
          ),
        );

      case LibraryLoaded:
        final entries = (state as LibraryLoaded).entries;
        return LibraryLayout(entries: entries);

      default:
        return const SizedBox();
    }
  }
}
