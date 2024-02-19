import 'dart:io';

import 'package:anikki/core/widgets/section/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/layouts/bloc/layout_bloc.dart';
import 'package:anikki/app/library/bloc/library_bloc.dart';
import 'package:anikki/app/library/widgets/library_layout.dart';
import 'package:anikki/app/settings/bloc/settings_bloc.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/anikki_action_button.dart';
import 'package:anikki/core/widgets/empty_widget.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/loader.dart';
import 'package:anikki/core/widgets/user_list_layout_toggle.dart';

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
            callback: (_) {
              final settingsBloc = BlocProvider.of<SettingsBloc>(context);

              BlocProvider.of<LibraryBloc>(context).add(
                LibraryUpdateRequested(
                  onUpdated: (path) => settingsBloc.add(
                    SettingsUpdated(
                      settingsBloc.state.settings.copyWith(
                        localDirectory: path,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          AnikkiAction(
            icon: Ionicons.open_outline,
            label: Platform.isMacOS ? 'Open in Finder' : 'Open in Explorer',
            callback: openFolderInExplorer,
          ),
        ],
      ),
    );

    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        final portrait = state is LayoutPortrait;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (portrait)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const UserListLayoutToggle(),
                  actionButton,
                ],
              )
            else ...[
              Row(
                children: [
                  SectionTitle(
                    backgroundColor: Colors.transparent,
                    text: 'Library',
                    actions: [
                      const UserListLayoutToggle(),
                      actionButton,
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 1,
              ),
            ],
            Expanded(
              child: BlocBuilder<LibraryBloc, LibraryState>(
                builder: (context, state) => switch (state) {
                  LibraryLoading() || LibraryInitial() => const Loader(),
                  LibraryError() => Center(
                      child: CustomErrorWidget(
                        title: 'Could not load your files at ${state.path}',
                        description: state.message,
                      ),
                    ),
                  LibraryEmpty() => const Center(
                      child: EmptyWidget(
                        title: 'No File',
                        subtitle: 'Could not find any video',
                      ),
                    ),
                  LibraryLoaded() => LibraryLayout(
                      entries: state.entries,
                    ),
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
