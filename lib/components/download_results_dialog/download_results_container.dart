import 'package:flutter/material.dart';

import 'package:anikki/components/download_results_dialog/download_results_dialog_filter.dart';
import 'package:anikki/components/download_results_dialog/download_results_dialog_list_view.dart';
import 'package:anikki/components/download_results_dialog/results_filter_mixin.dart';
import 'package:nyaa/nyaa.dart';

class DownloadResultsContainer extends StatefulWidget {
  const DownloadResultsContainer({
    super.key,
    required this.entries,
    required this.outlineColor,
    this.episode,
  });

  final List<Torrent> entries;
  final Color outlineColor;
  final int? episode;

  @override
  State<DownloadResultsContainer> createState() =>
      _DownloadResultsContainerState();
}

class _DownloadResultsContainerState extends State<DownloadResultsContainer>
    with ResultsFilterMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              const Spacer(),
              Text(
                'Torrent on nyaa.si',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),

              /// Here to help center the text
              IgnorePointer(
                child: Opacity(
                  opacity: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: widget.outlineColor,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DownloadResultsFilter(
            showAll: FilterValueHandler(
              showAll,
              (value) {
                setState(() {
                  showAll = !showAll;

                  if (value && smartFilter) {
                    smartFilter = false;
                  }
                });
              },
            ),
            smartFilter: FilterValueHandler(
              smartFilter,
              (value) {
                setState(() {
                  smartFilter = !smartFilter;

                  if (value && showAll) {
                    showAll = false;
                  }
                });
              },
            ),
            qualities: FilterValueHandler(
              qualities,
              (quality) {
                setState(() {
                  qualities.contains(quality)
                      ? qualities.remove(quality)
                      : qualities.add(quality);
                });
              },
            ),
            releaseGroup: FilterValueHandler(
              releaseGroupController,
              (_) {},
            ),
            additionalTerm: FilterValueHandler(
              additionalTermController,
              (_) {},
            ),
          ),
        ),
        Divider(
          color: widget.outlineColor,
        ),
        Expanded(
          child: DownloadResultsDialogListView(
            entries: filteredEntries,
            outlineColor: widget.outlineColor,
          ),
        ),
      ],
    );
  }
}
