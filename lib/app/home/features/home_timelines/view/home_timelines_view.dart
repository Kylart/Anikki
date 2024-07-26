import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/home/features/home_timelines/bloc/home_timelines_bloc.dart';
import 'package:anikki/app/home/features/home_timelines/widgets/home_timelines_content.dart';
import 'package:anikki/app/home/features/home_timelines/widgets/home_timelines_title.dart';
import 'package:anikki/core/widgets/empty_widget.dart';

class HomeTimelinesView extends StatelessWidget {
  const HomeTimelinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTimelinesBloc, HomeTimelinesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTimelinesTitle(),
              if (state.currentTypeEntries.isNotEmpty)
                const Expanded(
                  child: HomeTimelineContent(),
                )
              else
                const Expanded(
                  child: Center(
                    child: EmptyWidget(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
