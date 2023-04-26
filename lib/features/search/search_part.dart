import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:nyaa/nyaa.dart';

import 'package:anikki/features/download_results_dialog/download_results_dialog_list_view.dart';
import 'package:anikki/features/search/anilist_search_view.dart';

class SearchPart<T> extends StatefulWidget {
  const SearchPart({
    super.key,
    required this.future,
    required this.title,
  });

  final Future<T> future;
  final Widget title;

  @override
  State<SearchPart<T>> createState() => _SearchPartState<T>();
}

class _SearchPartState<T> extends State<SearchPart<T>> {
  bool get isNyaa => T == List<Torrent>;

  @override
  Widget build(BuildContext context) {
    int numberOfResults = isNyaa ? 13 : 5;

    final outline = Theme.of(context).colorScheme.outline.withOpacity(0.5);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.title,
        Divider(
          height: 1,
          color: outline,
        ),
        FutureBuilder(
          future: widget.future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            }

            final data = snapshot.data;

            if (snapshot.hasError || data == null) {
              return const ListTile(
                title: Text('No data'),
              );
            } else {
              if (isNyaa) {
                final entries = data as List<Torrent>;

                return Flexible(
                  child: DownloadResultsDialogListView(
                    entries: entries.length > numberOfResults
                        ? entries.sublist(0, numberOfResults)
                        : entries,
                    outlineColor: outline,
                  ),
                );
              } else {
                final entries = data as Map<AnilistSearchPart, List<Object>>;

                return Flexible(
                  child: AnilistSearchView(
                    entries: entries,
                    outline: outline,
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
