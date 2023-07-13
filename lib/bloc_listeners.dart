import 'package:anikki/features/downloader/presentation/widgets/downloader_dialog_handler.dart';
import 'package:flutter/material.dart';

class BlocListeners extends StatelessWidget {
  const BlocListeners({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DownloaderDialogHandler(
      child: child,
    );
  }
}
