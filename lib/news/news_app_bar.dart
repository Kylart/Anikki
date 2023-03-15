import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/components/settings_button.dart';
import 'package:anikki/models/settings_action.dart';
import 'package:anikki/providers/anilist/anilist.dart';
import 'package:anikki/providers/user_preferences/news_layout.dart';

class NewsAppBar extends StatefulWidget {
  const NewsAppBar(
      {super.key,
      required this.onDateChange,
      required this.initialRange,
      this.onOnlyFollowedChanged,
      this.onOnlySeenChanged,
      this.showTitle = true});

  final void Function(DateTimeRange layout) onDateChange;
  final DateTimeRange initialRange;

  final bool showTitle;

  final void Function(bool value)? onOnlySeenChanged;
  final void Function(bool value)? onOnlyFollowedChanged;

  @override
  State<NewsAppBar> createState() => _NewsAppBarState();
}

class _NewsAppBarState extends State<NewsAppBar> {
  bool showFollowed = false;
  bool showUnseen = false;

  @override
  Widget build(BuildContext context) {
    final anilistStore = context.watch<AnilistStore>();

    List<SettingsAction> settings = [
      if (anilistStore.isConnected)
        SettingsAction(
          callback: () {},
          label: 'Only followed entries',
          trailing: StatefulBuilder(
            builder: (context, setState) {
              return Switch(
                value: showFollowed,
                onChanged: (bool value) {
                  setState(() {
                    showFollowed = value;
                  });
                  if (widget.onOnlyFollowedChanged != null) {
                    widget.onOnlyFollowedChanged!(value);
                  }
                },
              );
            },
          ),
        ),
      if (anilistStore.isConnected)
        SettingsAction(
          callback: () {},
          label: 'Only unseen entries',
          trailing: StatefulBuilder(
            builder: (context, setState) {
              return Switch(
                value: showUnseen,
                onChanged: (bool value) {
                  setState(() {
                    showUnseen = value;
                  });
                  if (widget.onOnlySeenChanged != null) {
                    widget.onOnlySeenChanged!(value);
                  }
                },
              );
            },
          ),
        ),
    ];

    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      title: widget.showTitle ? const Text('News') : const SizedBox(),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () async {
              final dateRange = await showDateRangePicker(
                context: context,
                initialDateRange: widget.initialRange,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 7)),
              );

              if (dateRange == null) return;

              widget.onDateChange(dateRange);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleButtons(
            isSelected: context.watch<NewsLayout>().layout == NewsLayouts.grid
                ? [false, true]
                : [true, false],
            onPressed: (int index) {
              context.read<NewsLayout>().layout =
                  index == 0 ? NewsLayouts.list : NewsLayouts.grid;
            },
            children: const [
              Icon(Icons.list),
              Icon(Icons.grid_view),
            ],
          ),
        ),
        if (settings.isNotEmpty) SettingsButton(actions: settings),
      ],
    );
  }
}
