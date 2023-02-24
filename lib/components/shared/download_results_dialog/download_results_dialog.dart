import 'package:anikki/components/shared/download_results_dialog/download_results_list_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:anikki/providers/nyaa/nyaa.dart';

class DownloadResultsDialog extends StatelessWidget {
  const DownloadResultsDialog(
      {super.key, required this.term, required this.episode});

  final int? episode;

  final String term;

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline.withOpacity(0.5);

    return Dialog(
      child: FutureBuilder(
        future: context.read<NyaaStore>().search(term),
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

            return DownloadResultsListView(
              entries: snapshot.data!,
              outlineColor: outlineColor,
              episode: episode,
            );
          }
        },
      ),
    );
  }
}
