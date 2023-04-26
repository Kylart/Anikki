import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:anikki/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/widgets/anikki_icon.dart';
import 'package:anikki/news/widgets/news_layout_toggle.dart';
import 'package:anikki/widgets/anikki_action_button.dart';
import 'package:anikki/models/anikki_action.dart';

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
    return BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
        builder: (context, state) {
      final isConnected = state is AnilistAuthSuccess;

      List<AnikkiAction> settings = [
        if (isConnected)
          AnikkiAction(
            callback: (_) {},
            icon: Icons.bookmark_add_outlined,
            label: 'Only followed entries',
            trailing: StatefulBuilder(
              builder: (context, setState) {
                return PlatformSwitch(
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
        if (isConnected)
          AnikkiAction(
            callback: (_) {},
            icon: Icons.bookmark_added_outlined,
            label: 'Only unseen entries',
            trailing: StatefulBuilder(
              builder: (context, setState) {
                return PlatformSwitch(
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

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.showTitle)
              Text(
                'News',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const AnikkiIcon(icon: Icons.calendar_month),
                onPressed: () async {
                  final dateRange = await showDateRangePicker(
                    context: context,
                    initialDateRange: widget.initialRange,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now().add(const Duration(days: 7)),
                  );

                  if (dateRange == null) return;

                  widget.onDateChange(dateRange);
                },
              ),
            ),
            const NewsLayoutToggle(),
            if (settings.isNotEmpty) AnikkiActionButton(actions: settings),
          ],
        ),
      );
    });
  }
}
