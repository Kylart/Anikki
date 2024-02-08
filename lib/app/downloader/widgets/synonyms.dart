import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Synonyms extends StatelessWidget {
  const Synonyms({
    super.key,
    required this.state,
  });

  List<String> get synonyms => {
        /// Anitomy parsed name
        state.entry?.entries.first.title,

        /// Full english name
        state.media?.title?.english,

        /// Native name (probably in Japanese)
        state.media?.title?.native,

        /// Romaji name
        state.media?.title?.romaji,

        /// All the other synonyms
        ...(state.media?.synonyms?.whereType<String>().toList() ?? []),
      }.whereType<String>().toList();

  final DownloaderSuccess state;

  @override
  Widget build(BuildContext context) {
    void onSelected(value) {
      BlocProvider.of<DownloaderBloc>(context).add(
        DownloaderRequested(
          media: state.media,
          entry: state.entry,
          title: value,
          isStreaming: state.isStreaming,
          episode: state.episode,
        ),
      );
    }

    if (isLandscape(context)) {
      return DropdownMenu(
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
        width: 300,
        hintText: 'Other names',
        onSelected: onSelected,
        textStyle: const TextStyle(
          fontSize: 14,
        ),
        dropdownMenuEntries: synonyms
            .map(
              (e) => DropdownMenuEntry(
                value: e,
                label: e,
              ),
            )
            .toList(),
      );
    } else {
      return IconButton.outlined(
        onPressed: () {
          if (Platform.isIOS) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    title: const Text('Other names'),
                    actions: synonyms
                        .map(
                          (e) => CupertinoActionSheetAction(
                            child: Text(e),
                            onPressed: () => onSelected(e),
                          ),
                        )
                        .toList(),
                  );
                });
          } else {
            showModalBottomSheet(
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: synonyms
                          .map(
                            (e) => ListTile(
                              title: Text(e),
                              onTap: () => onSelected(e),
                            ),
                          )
                          .toList(),
                    ),
                  );
                });
          }
        },
        icon: const Icon(Icons.multiple_stop),
      );
    }
  }
}
