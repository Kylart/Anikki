import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/downloader/widgets/widgets.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/core/widgets/empty_widget.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/loading_widget.dart';
import 'package:anikki/data/data.dart';

part 'downloader_success_view.dart';

class DownloaderView extends StatelessWidget {
  const DownloaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloaderBloc, DownloaderState>(
      builder: (context, state) => switch (state) {
        DownloaderError() => CustomErrorWidget(
            title: 'Could not find results for ${state.term}',
            description: state.message,
          ),
        DownloaderLoading() => const Center(
            child: LoadingWidget(
              title: 'Looking for available torrents...',
            ),
          ),
        DownloaderSuccess() => _DownloaderSuccessView(state),
        DownloaderClose() || DownloaderShow() => const SizedBox(),
      },
    );
  }
}
