import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:anikki/core/helpers/screen_format.dart';
import 'package:anikki/features/downloader/presentation/bloc/downloader_bloc.dart';
import 'package:anikki/features/downloader/presentation/view/downloader_view.dart';

void showDownloader(BuildContext context, String term) {
  final bloc = BlocProvider.of<DownloaderBloc>(context);

  if (isPortrait(context)) {
    Navigator.of(context)
        .push(
          MaterialPageRoute<void>(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text('Results for $term'),
              ),
              body: const DownloaderView(),
            ),
          ),
        )
        .then((value) => bloc.add(const DownloaderClosed(null)));
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: DownloaderView(),
        );
      },
    ).then((value) => bloc.add(const DownloaderClosed(null)));
  }
}
