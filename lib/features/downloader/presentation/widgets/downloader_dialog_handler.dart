import 'package:anikki/features/downloader/presentation/bloc/downloader_bloc.dart';
import 'package:anikki/features/downloader/presentation/helpers/show_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloaderDialogHandler extends StatefulWidget {
  const DownloaderDialogHandler({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<DownloaderDialogHandler> createState() => _DownloaderDialogHandlerState();
}

class _DownloaderDialogHandlerState extends State<DownloaderDialogHandler> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloaderBloc, DownloaderState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case DownloaderClose:
            Navigator.of(context).pop();
            break;

          case DownloaderShow:
            showDownloader(context, (state as DownloaderShow).term);
            break;

          default:
            return;
        }
      },
      child: widget.child,
    );
  }
}
