import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timelines_plus/timelines_plus.dart';

import 'package:anikki/app/home/features/home_timelines/bloc/home_timelines_bloc.dart';
import 'package:anikki/app/home/features/home_timelines/models/timeline_type.dart';
import 'package:anikki/app/home/features/home_timelines/widgets/home_timelines_feed_card.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/entry/entry_tag.dart';

class HomeTimelineContent extends StatelessWidget {
  const HomeTimelineContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTimelinesBloc, HomeTimelinesState>(
      builder: (context, state) {
        return TimelineTheme(
          data: TimelineThemeData(
            color: context.colorScheme.primaryContainer,
            indicatorTheme: IndicatorThemeData(
              color: context.colorScheme.onPrimaryContainer,
            ),
            connectorTheme: const ConnectorThemeData(space: 36.0),
          ),
          child: Timeline.tileBuilder(
            builder: TimelineTileBuilder.fromStyle(
              nodePositionBuilder: (context, index) => 0.85,
              contentsAlign: ContentsAlign.reverse,
              oppositeContentsBuilder: (context, index) => Builder(
                builder: (context) {
                  final entry = state.currentTypeEntries.elementAt(index);
                  final airingTime = DateTime.fromMillisecondsSinceEpoch(
                    entry.timestamp,
                  );

                  final day = airingTime.day;
                  final month = '0${airingTime.month}';
                  final hour = airingTime.hour + 1;
                  final minutes = '${airingTime.minute}0'.substring(0, 2);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$day/$month'),
                      Text('$hour:$minutes'),
                    ],
                  );
                },
              ),
              contentsBuilder: (context, index) {
                final entry = state.currentTypeEntries.elementAt(index);

                return HomeTimelineFeedCard(
                  entry: entry,
                  description: entry.description == null
                      ? const SizedBox()
                      : switch (state.type) {
                          TimelineType.feed => Center(
                              child: EntryTag(
                                blurLevel: 0,
                                child: Text(entry.description!),
                              ),
                            ),
                          TimelineType.history => Center(
                              child: EntryTag(
                                blurLevel: 0,
                                child: Text(entry.description!),
                              ),
                            ),
                          TimelineType.notifications => Center(
                              child: EntryTag(
                                blurLevel: 0,
                                child: Text(entry.description!),
                              ),
                            ),
                        },
                );
              },
              itemCount: state.currentTypeEntries.length,
            ),
          ),
        );
      },
    );
  }
}
