import 'package:flutter/material.dart';

import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/features/layouts/shared/helpers/helpers.dart';
import 'package:anikki/features/downloader/presentation/view/downloader_view.dart';

void showDownloader(BuildContext context, String term) {
  if (isPortrait(context)) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Results for $term'),
          ),
          body: const DownloaderView(),
        ),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: LayoutCard(
            child: DownloaderView(),
          ),
        );
      },
    );
  }
}
