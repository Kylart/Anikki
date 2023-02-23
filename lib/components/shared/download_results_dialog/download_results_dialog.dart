import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:anikki/components/shared/download_results_dialog/download_results_dialog_filter.dart';
import 'package:anikki/providers/nyaa/types/torrent.dart';
import 'package:anikki/components/shared/download_results_dialog/download_results_dialog_list_view.dart';
import 'package:anikki/providers/nyaa/nyaa.dart';

class DownloadResultsDialog extends StatelessWidget {
  const DownloadResultsDialog(
      {super.key, required this.term, required this.episode});

  final int? episode;

  final String term;

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline.withOpacity(0.5);
    final store = context.read<NyaaStore>();

    return Dialog(
      child: FutureBuilder(
        future: store.search(term),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 200,
              width: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.hasError) return Text(snapshot.error.toString());

            final entries = snapshot.data!;
            final screenSize = MediaQuery.of(context).size;

            List<Torrent>? filteredEntries;

            return StatefulBuilder(
              builder: (context, setState) {
                return SizedBox(
                  width: screenSize.width * 0.80,
                  height: screenSize.height * 0.80,
                  child: Card(
                    child: Column(
                      children: [
                        AppBar(
                          title: Text('Results for "$term"'),
                          centerTitle: true,
                        ),
                        Divider(
                          color: outlineColor,
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DownloadResultsDialogFilter(
                                entries: entries,
                                episode: episode,
                                onChange: (entries) {
                                  setState(() {
                                    filteredEntries = entries;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: DownloadResultsDialogListView(
                            entries: filteredEntries ?? entries,
                            outlineColor: outlineColor,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
