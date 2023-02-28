import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anikki/providers/user_preferences/news_layout.dart';

class NewsAppBar extends StatefulWidget {
  const NewsAppBar({
    super.key,
    required this.onDateChange,
    required this.initialRange,
  });

  final void Function(DateTimeRange layout) onDateChange;
  final DateTimeRange initialRange;

  @override
  State<NewsAppBar> createState() => _NewsAppBarState();
}

class _NewsAppBarState extends State<NewsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      title: const Text('News'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.calendar_today),
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
      ],
    );
  }
}
