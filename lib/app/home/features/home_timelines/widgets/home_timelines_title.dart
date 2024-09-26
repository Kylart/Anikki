import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/home/features/home_timelines/bloc/home_timelines_bloc.dart';
import 'package:anikki/app/home/features/home_timelines/models/models.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/core/widgets/section/section_title.dart';

class HomeTimelinesTitle extends StatelessWidget {
  const HomeTimelinesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTimelinesBloc, HomeTimelinesState>(
      builder: (context, state) {
        return SectionTitle(
          text: state.type.title,
          color: context.colorScheme.primaryContainer.withOpacity(0.2),
          actions: [
            ToggleButtons(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              isSelected: [
                state.type == TimelineType.feed,
                state.type == TimelineType.history,
              ],
              children: const [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Icon(HugeIcons.strokeRoundedCalendar01),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Icon(HugeIcons.strokeRoundedCalendar03),
                ),
              ],
              onPressed: (index) {
                BlocProvider.of<HomeTimelinesBloc>(context).add(
                  HomeTimelinesTypeChange(
                    switch (index) {
                      0 => TimelineType.feed,
                      1 => TimelineType.history,
                      _ => throw UnimplementedError(),
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
