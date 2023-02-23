import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:anikki/providers/nyaa/types/torrent.dart';

enum Quality {
  low,
  medium,
  high,
}

extension QualityValue on Quality {
  String get value {
    switch (this) {
      case Quality.low:
        return '480p';
      case Quality.medium:
        return '720p';
      case Quality.high:
        return '1080p';
    }
  }
}

class DownloadResultsDialogFilter extends StatefulWidget {
  const DownloadResultsDialogFilter({
    super.key,
    required this.entries,
    required this.onChange,
    required this.episode,
  });

  final List<Torrent> entries;
  final int? episode;
  final void Function(List<Torrent>? filteredEntries) onChange;

  @override
  State<DownloadResultsDialogFilter> createState() =>
      _DownloadResultsDialogFilterState();
}

class _DownloadResultsDialogFilterState
    extends State<DownloadResultsDialogFilter> {
  /// Enable custom filter that will filter the results using Anitomy
  bool smartFilter = false;

  /// Ignore everything and show all the entries
  bool showAll = false;

  /// Release group to use
  TextEditingController releaseGroupController = TextEditingController();
  String? get releaseGroup => releaseGroupController.value.text;

  /// Anything the user might want to add to the query
  TextEditingController additionalTermController = TextEditingController();
  String? get additionalTerm => additionalTermController.value.text;

  /// Qualities to filter in / out of the results
  List<String> get qualitiesValues => qualities.map((q) => q.value).toList();
  List<Quality> qualities = [
    Quality.medium,
    Quality.high,
  ];

  List<Torrent> get filteredEntries {
    List<Torrent> result = widget.entries;

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

  void update() {
    widget.onChange(filteredEntries);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return Dialog(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 600,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            switchTile(
                              label: 'Show all',
                              value: showAll,
                              onChanged: (value) {
                                setState(() {
                                  showAll = !showAll;

                                  if (value && smartFilter) {
                                    smartFilter = false;
                                  }
                                });

                                update();
                              },
                            ),
                            switchTile(
                              label: 'Smart filter',
                              value: smartFilter,
                              onChanged: (value) {
                                setState(() {
                                  smartFilter = !smartFilter;

                                  if (value && showAll) showAll = false;
                                });

                                update();
                              },
                            ),
                            qualityChoiceTile(
                                onTap: (quality) {
                                  setState(() {
                                    qualities.contains(quality)
                                        ? qualities.remove(quality)
                                        : qualities.add(quality);
                                  });

                                  update();
                                },
                                qualities: qualities,
                                selectedColor:
                                    Theme.of(context).colorScheme.primary),
                            textFieldTile(
                              label: 'Release Group',
                              controller: releaseGroupController,
                              onChanged: (_) => update(),
                              hintText: 'Enter a Release group',
                            ),
                            textFieldTile(
                              label: 'Additional term',
                              controller: additionalTermController,
                              onChanged: (_) => update(),
                              hintText: 'Anything can go here',
                            ),
                            ListTile(
                              trailing: TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Close'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            });
      },
      icon: const Icon(Icons.tune),
    );
  }
}

SwitchListTile switchTile({
  required void Function(bool value) onChanged,
  required String label,
  required bool value,
}) {
  return SwitchListTile(
    title: Text(label),
    value: value,
    onChanged: onChanged,
  );
}

ListTile qualityChoiceTile({
  required void Function(Quality quality) onTap,
  required List<Quality> qualities,
  required Color selectedColor,
}) {
  return ListTile(
    title: Row(
      children: [
        const Text('Quality'),
        const Spacer(),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Quality.values.map<Widget>((quality) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: InkWell(
                  onTap: () => onTap(quality),
                  child: Chip(
                    backgroundColor:
                        qualities.contains(quality) ? selectedColor : null,
                    label: Text(quality.name.capitalize),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

Widget textFieldTile({
  required String label,
  required void Function(String value) onChanged,
  required TextEditingController controller,
  required String hintText,
}) {
  return ListTile(
    title: Row(
      children: [
        Text(label),
        const Spacer(),
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              autocorrect: false,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hintText,
                suffixIcon: IconButton(
                  onPressed: controller.clear,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
