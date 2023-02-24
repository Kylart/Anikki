import 'package:flutter/material.dart';

import 'package:anikki/components/shared/download_results_dialog/download_results_container.dart';
import 'package:anikki/providers/nyaa/types/quality.dart';
import 'package:anikki/providers/nyaa/types/torrent.dart';

mixin ResultsFilterMixin on State<DownloadResultsContainer> {
  /// Enable custom filter that will filter the results using Anitomy
  bool smartFilter = true;

  /// Ignore everything and show all the entries
  bool showAll = false;

  /// Release group to use
  TextEditingController releaseGroupController = TextEditingController();
  String? releaseGroup;

  /// Anything the user might want to add to the query
  TextEditingController additionalTermController = TextEditingController();
  String? additionalTerm;

  /// Qualities to filter in / out of the results
  List<String> get qualitiesValues => qualities.map((q) => q.value).toList();
  List<Quality> qualities = [
    Quality.medium,
    Quality.high,
  ];

  @override
  void initState() {
    additionalTermController.addListener(() {
      setState(() {
        additionalTerm = additionalTermController.value.text;
      });
    });

    releaseGroupController.addListener(() {
      setState(() {
        releaseGroup = releaseGroupController.value.text;
      });
    });

    super.initState();
  }

  int sortBySeeders(Torrent a, Torrent b) {
    return int.tryParse(b.seeders)
            ?.compareTo(int.tryParse(a.seeders) ?? double.negativeInfinity) ??
        -1;
  }

  List<Torrent> get filteredEntries {
    List<Torrent> result = List.from(widget.entries);

    result.sort(sortBySeeders);

    /// If the showAll switch is true, we just return everything
    if (showAll) return result;

    /// Filtering relesae group if any
    if (releaseGroup != null) {
      result = result.where((element) {
        if (element.parsed.releaseGroup == null) return false;

        return element.parsed.releaseGroup!
            .toLowerCase()
            .contains(releaseGroup!.toLowerCase());
      }).toList();
    }

    /// Filtering addintional term if any
    if (additionalTerm != null) {
      result = result.where((element) {
        return element.name
            .toLowerCase()
            .contains(additionalTerm!.toLowerCase());
      }).toList();
    }

    /// Filtering over the qualities
    if (qualities.isNotEmpty) {
      final qualityRegex = RegExp('(${qualitiesValues.join('|')})');
      result = result
          .where((element) => qualityRegex.hasMatch(element.name))
          .toList();
    }

    if (smartFilter) {
      if (widget.episode != null) {
        result = result.where((element) {
          if (element.parsed.episode == null) return false;

          return int.tryParse(element.parsed.episode!) == widget.episode;
        }).toList();
      }
    }

    return result;
  }
}
