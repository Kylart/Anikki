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
  const DownloadResultsDialogFilter({super.key, required this.entries});

  final List<Torrent> entries;

  @override
  State<DownloadResultsDialogFilter> createState() =>
      _DownloadResultsDialogFilterState();
}

class _DownloadResultsDialogFilterState
    extends State<DownloadResultsDialogFilter> {
  bool smartFilter = false;
  bool showAll = false;
  String? releaseGroup;
  String? additionalTerm;
  List<Quality> qualities = [
    Quality.medium,
    Quality.high,
  ];

  double tileWidth = 200.0;

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
                              },
                            ),
                            qualityChoiceTile(
                                onTap: (quality) {
                                  setState(() {
                                    qualities.contains(quality)
                                        ? qualities.remove(quality)
                                        : qualities.add(quality);
                                  });
                                },
                                qualities: qualities,
                                selectedColor:
                                    Theme.of(context).colorScheme.primary),
                            textFieldTile(
                              label: 'Release Group',
                              onChanged: (value) {
                                setState(() {
                                  releaseGroup = value;
                                });
                              },
                              hintText: 'Enter a Release group',
                            ),
                            textFieldTile(
                              label: 'Additional term',
                              onChanged: (value) {
                                setState(() {
                                  additionalTerm = value;
                                });
                              },
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
              autocorrect: false,
              onChanged: onChanged,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hintText,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
