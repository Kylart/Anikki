import 'package:empty_widget/empty_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/library/presentation/bloc/library_bloc.dart';
import 'package:anikki/core/widgets/loader.dart';
import 'package:anikki/core/widgets/error_tile.dart';
import 'package:anikki/features/library/presentation/widgets/library_layout.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
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
            final loadedState = (state as LibraryLoaded);
            return LibraryLayout(
              entries: loadedState.entries,
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
