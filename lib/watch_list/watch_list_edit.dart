import 'package:anilist/anilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WatchListEdit extends StatefulWidget {
  const WatchListEdit({super.key, required this.entry});

  final AnilistListEntry entry;

  @override
  State<WatchListEdit> createState() => _WatchListEditState();
}

class _WatchListEditState extends State<WatchListEdit> {
  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;

    AnilistMediaListStatus status = entry.status;
    int score = entry.score;
    int progress = entry.progress ?? 0;
    int repeat = entry.repeat ?? 0;
    AnilistDate startedAt = entry.startedAt;
    AnilistDate completedAt = entry.completedAt;
    String? notes = entry.notes;

    return Stack(
      children: [
        if (entry.media.bannerImage != null)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Opacity(
              opacity: 0.7,
              child: Image.network(entry.media.bannerImage),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 35.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.end,
                alignment: WrapAlignment.start,
                children: [
                  if (entry.media.coverImage?.extraLarge != null ||
                      entry.media.coverImage?.large != null)
                    Image.network(
                      entry.media.coverImage?.extraLarge ??
                          entry.media.coverImage!.large!,
                      height: 300,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      entry.media.title?.title() ?? 'N/A',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400.0,
                  childAspectRatio: 32 / 9,
                ),
                children: [
                  ListTile(
                    title: DropdownButton<AnilistMediaListStatus>(
                      value: status,
                      isExpanded: true,
                      onChanged: (value) {
                        if (value == null) return;

                        setState(() {
                          status = value;
                        });
                      },
                      items: AnilistMediaListStatus.values.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(status.label),
                        );
                      }).toList(),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Score',
                        hintText: 'From 0 to 100',
                      ),
                      initialValue: score.toString(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        NumericalRangeFormatter(min: 0, max: 100),
                      ],
                      onChanged: (value) => setState(() {
                        score = int.tryParse(value) ?? 0;
                      }),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Progress',
                        hintText: entry.media.episodes != null
                            ? 'Up to ${entry.media.episodes}'
                            : null,
                      ),
                      initialValue: progress.toString(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        if (entry.media.episodes != null)
                          NumericalRangeFormatter(
                            min: 0,
                            max: entry.media.episodes!.toDouble(),
                          ),
                      ],
                      onChanged: (value) => setState(() {
                        progress = int.tryParse(value) ?? 0;
                      }),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Start Date',
                      ),
                      initialValue: entry.startedAt
                          .toDateTime()
                          ?.toString()
                          .substring(0, 11),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        );

                        if (date == null) return;

                        setState(() {
                          startedAt = AnilistDate.fromDateTime(date);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Finish Date',
                      ),
                      initialValue: entry.completedAt
                          .toDateTime()
                          ?.toString()
                          .substring(0, 11),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        );

                        if (date == null) return;

                        setState(() {
                          completedAt = AnilistDate.fromDateTime(date);
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Total rewatches',
                      ),
                      initialValue: repeat.toString(),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) => setState(() {
                        repeat = int.tryParse(value) ?? 0;
                      }),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Notes',
                ),
                initialValue: notes,
                maxLines: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Delete')),
                    TextButton(onPressed: () {}, child: const Text('Save')),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return newValue.copyWith(text: min.toStringAsFixed(2));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}
