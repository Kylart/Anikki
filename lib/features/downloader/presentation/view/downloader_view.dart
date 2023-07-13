import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:anikki/core/core.dart';
import 'package:anikki/features/downloader/presentation/widgets/widgets.dart';
import 'package:anikki/features/downloader/presentation/bloc/downloader_bloc.dart';
import 'package:anikki/features/layouts/shared/helpers/helpers.dart';
import 'package:anikki/core/widgets/error_tile.dart';
import 'package:anikki/core/widgets/loader.dart';

class DownloaderView extends StatelessWidget {
  const DownloaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloaderBloc, DownloaderState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case DownloaderError:
            final currentState = state as DownloaderError;

            return ErrorTile(
              title: 'Could not find results for ${currentState.term}',
              description: currentState.message,
            );

          case DownloaderLoading:
            return const Loader();

          case DownloaderSuccess:
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
                      DownloaderMore(
                        onChanged: (value) {
                          bloc.add(
                            DownloaderFiltered(
                              bloc.filter.copyWith(
                                more: value,
                              ),
                            ),
                          );
                        },
                      ),
                      Synonyms(
                        state: currentState,
                        onSelected: (value) {
                          bloc.add(
                            DownloaderRequested(
                              media: currentState.media,
                              entry: currentState.entry,
                              title: value,
                            ),
                          );
                        },
                      ),
                      SegmentedButton(
                        multiSelectionEnabled: true,
                        emptySelectionAllowed: true,
                        selectedIcon: const Icon(Icons.done),
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
                        ? Center(
                            child: SizedBox(
                              height: 300,
                              width: 300,
                              child: EmptyWidget(
                                title: 'No result',
                              ),
                            ),
                          )
                        : TorrentsList(torrents: torrents),
                  ),
                ],
              ),
            );

          case DownloaderClose:
          default:
            return const SizedBox();
        }
      },
    );
  }
}
