import 'package:flutter/material.dart';

import 'package:anikki/features/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/helpers/screen_format.dart';

class Synonyms extends StatelessWidget {
  Synonyms({
    super.key,
    required this.state,
    required this.onSelected,
  }) {
    synonyms = {
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
  }

  late final List<String> synonyms;

  final DownloaderSuccess state;
  final void Function(String? value) onSelected;

  @override
  Widget build(BuildContext context) {
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
            .whereType<String>()
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
        onPressed: () {},
        icon: const Icon(Icons.multiple_stop),
      );
    }
  }
}
