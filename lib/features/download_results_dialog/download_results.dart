import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';

import 'package:anikki/features/download_results_dialog/download_results_container.dart';
import 'package:nyaa/nyaa.dart';

class DownloadResults extends StatelessWidget {
  const DownloadResults({super.key, required this.term, required this.episode});

  final int? episode;

  final String term;

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline.withOpacity(0.5);

    return FutureBuilder(
      future: Nyaa().search(term),
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
          if (snapshot.hasError) {
            return SizedBox(
              height: 400,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 300,
                      child: EmptyWidget(
                        image: null,
                        packageImage: PackageImage.Image_4,
                        title: 'Could not find anything',
                        titleTextStyle: const TextStyle(
                          fontSize: 22,
                          color: Color(0xff9da9c7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    )
                  ],
                ),
              ),
            );
          }

          return DownloadResultsContainer(
            entries: snapshot.data!,
            outlineColor: outlineColor,
            episode: episode,
          );
        }
      },
    );
  }
}
