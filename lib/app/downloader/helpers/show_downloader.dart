import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/core/widgets/layout_card.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/downloader/view/downloader_view.dart';

void showDownloader(BuildContext context, String term) async {
  final bloc = BlocProvider.of<DownloaderBloc>(context);

  if (isPortrait(context)) {
    await Navigator.of(context).push(
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
    await showDialog(
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

  bloc.add(const DownloaderClosed());
}
