import 'package:flutter/material.dart';
import 'package:anikki/components/shared/download_results_dialog/download_results_dialog_list_view.dart';
import 'package:anikki/providers/nyaa/nyaa.dart';
import 'package:provider/provider.dart';

class DownloadResultsDialog extends StatelessWidget {
  const DownloadResultsDialog({super.key, required this.term});

  final String term;

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline;
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
                    Expanded(
                      child: DownloadResultsDialogListView(entries: entries),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
