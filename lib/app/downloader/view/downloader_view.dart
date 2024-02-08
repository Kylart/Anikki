import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';
import 'package:anikki/app/downloader/widgets/widgets.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/core/widgets/empty_widget.dart';
import 'package:anikki/core/widgets/error_widget.dart';
import 'package:anikki/core/widgets/loader.dart';
import 'package:anikki/data/data.dart';
import 'package:ionicons/ionicons.dart';

class DownloaderView extends StatelessWidget {
  const DownloaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloaderBloc, DownloaderState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (DownloaderError):
            final currentState = state as DownloaderError;

            return CustomErrorWidget(
              title: 'Could not find results for ${currentState.term}',
              description: currentState.message,
            );

          case const (DownloaderLoading):
            return const Loader();

          case const (DownloaderSuccess):
            final bloc = BlocProvider.of<DownloaderBloc>(context);

            final currentState = state as DownloaderSuccess;
            final torrents = currentState.filteredTorrents;

            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  if (isLandscape(context)) ...[
                    ListTile(
                      title: Text(
                        'Results for ${currentState.term}',
                      ),
                      subtitle: currentState.isStreaming
                          ? const Text('Choose which torrent to stream')
                          : null,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          bloc.add(const DownloaderClosed());
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    const Divider(),
                  ],
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 8.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Column(
                        children: [
                          Tooltip(
                            message:
                                'Overrides all filters to show all the results.',
                            child: Text(
                              'Show all',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          PlatformSwitch(
                            value: currentState.filter.showAll,
                            onChanged: (value) {
                              bloc.add(
                                DownloaderFiltered(
                                  bloc.filter.copyWith(
                                    showAll: value,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Tooltip(
                            message:
                                'Enables smart filtering that will refine the research to match the episode researched.',
                            child: Text(
                              'Smart filter',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          PlatformSwitch(
                            value: currentState.filter.smartFilter,
                            onChanged: (value) {
                              bloc.add(
                                DownloaderFiltered(
                                  bloc.filter.copyWith(
                                    smartFilter: value,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const DownloaderMore(),
                      Synonyms(
                        state: currentState,
                      ),
                      SegmentedButton(
                        multiSelectionEnabled: true,
                        emptySelectionAllowed: true,
                        selectedIcon: const Icon(Ionicons.checkmark_outline),
                        segments: Quality.values
                            .map((e) =>
                                ButtonSegment(value: e, label: Text(e.value)))
                            .toList(),
                        selected: currentState.filter.qualities.toSet(),
                        onSelectionChanged: (qualities) {
                          bloc.add(
                            DownloaderFiltered(
                              bloc.filter.copyWith(
                                qualities: qualities.toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: torrents.isEmpty
                        ? const EmptyWidget(
                            title: 'No result',
                            height: 300,
                            width: 300,
                          )
                        : TorrentsList(
                            torrents: torrents,
                          ),
                  ),
                ],
              ),
            );

          case const (DownloaderClose):
          default:
            return const SizedBox();
        }
      },
    );
  }
}
