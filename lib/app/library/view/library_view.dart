import 'dart:io';

import 'package:anikki/core/widgets/user_list_layout_toggle.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/anikki_action_button.dart';
import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/core/widgets/loader.dart';
import 'package:anikki/core/widgets/error_tile.dart';
import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/library/widgets/library_layout.dart';
import 'package:ionicons/ionicons.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final actionButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AnikkiActionButton(
        actions: [
          AnikkiAction(
            icon: Ionicons.folder_open_outline,
            label: 'Change folder',
            callback: (_) => BlocProvider.of<LibraryBloc>(context)
                .add(const LibraryUpdateRequested()),
          ),
          AnikkiAction(
            icon: Ionicons.open_outline,
            label: Platform.isMacOS ? 'Open in Finder' : 'Open in Explorer',
            callback: (context) async => openFolderInExplorer(context),
          ),
        ],
      ),
    );

    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final portrait = state is LayoutPortrait;

        return LayoutCard(
          transparent: portrait,
          child: Column(
            children: [
              if (portrait)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const UserListLayoutToggle(),
                    actionButton,
                  ],
                )
              else
                AppBar(
                  title: const Text('Library'),
                  actions: [
                    const UserListLayoutToggle(),
                    actionButton,
                  ],
                ),
              Expanded(
                child: BlocBuilder<LibraryBloc, LibraryState>(
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
