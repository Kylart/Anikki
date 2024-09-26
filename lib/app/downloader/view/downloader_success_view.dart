part of 'downloader_view.dart';

class _DownloaderSuccessView extends StatelessWidget {
  const _DownloaderSuccessView(this.state);

  final DownloaderSuccess state;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DownloaderBloc>(context);

    final torrents = state.filteredTorrents;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          if (context.landscape) ...[
            ListTile(
              title: Text(
                'Results for ${state.term}',
              ),
              subtitle: state.isStreaming
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
                    message: 'Overrides all filters to show all the results.',
                    child: Text(
                      'Show all',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  PlatformSwitch(
                    value: state.filter.showAll,
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
                    value: state.filter.smartFilter,
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
                state: state,
              ),
              SegmentedButton(
                multiSelectionEnabled: true,
                emptySelectionAllowed: true,
                selectedIcon: const Icon(HugeIcons.strokeRoundedTick01),
                segments: Quality.values
                    .map((e) => ButtonSegment(value: e, label: Text(e.value)))
                    .toList(),
                selected: state.filter.qualities.toSet(),
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
  }
}
